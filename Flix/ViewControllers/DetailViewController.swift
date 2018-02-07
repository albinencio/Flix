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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
