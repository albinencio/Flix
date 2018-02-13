//
//  DetailViewController.swift
//  Flix
//
//  Created by Alberto on 2/6/18.
//  Copyright © 2018 Alberto Nencioni. All rights reserved.
//

import UIKit

enum MovieKeys {
  static let TITLE = "title"
  static let RELEASE_DATE = "release_date"
  static let OVERVIEW = "overview"
  static let BACKDROP_PATH = "backdrop_path"
  static let POSTER_PATH = "poster_path"
  static let ID = "id"
}

class DetailViewController: UIViewController {
  
  @IBOutlet weak var backdropImageView: UIImageView!
  @IBOutlet weak var posterImageView: UIImageView!
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var releaseDateLabel: UILabel!
  @IBOutlet weak var overviewLabel: UILabel!
  
  var movie: [String: Any]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let movie = movie {
      titleLabel.text = movie[MovieKeys.TITLE] as? String
      releaseDateLabel.text = movie[MovieKeys.RELEASE_DATE] as? String
      overviewLabel.text = movie[MovieKeys.OVERVIEW] as? String
      
      let backdropPathString = movie[MovieKeys.BACKDROP_PATH] as! String
      let posterPathString = movie[MovieKeys.POSTER_PATH] as! String
      let baseURLString = "https://image.tmdb.org/t/p/w500"
      
      let backdropURL = URL(string: baseURLString + backdropPathString)!
      backdropImageView.af_setImage(withURL: backdropURL)
      
      let posterURL = URL(string: baseURLString + posterPathString)!
      posterImageView.af_setImage(withURL: posterURL)
      
      
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let first_url = "https://api.themoviedb.org/3/movie/"
    let second_url = "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US"
    let movie_id = movie![MovieKeys.ID] as! NSNumber
    let url = URL(string: first_url + movie_id.stringValue + second_url)!
    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    let task = session.dataTask(with: request) { (data, response, error) in
      // This will run when the network request returns
      if let error = error {
        print(error.localizedDescription)
      } else if let data = data {
        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        let videos = dataDictionary["results"] as! [[String: Any]]
        let video = videos[0]
        let key = video["key"] as! String
        let trailerViewController = segue.destination as! TrailerViewController
        trailerViewController.url_string = "https://www.youtube.com/watch?v=" + key
      }
    }
    
    task.resume()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
