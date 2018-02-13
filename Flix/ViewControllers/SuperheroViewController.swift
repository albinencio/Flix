//
//  SuperheroViewController.swift
//  Flix
//
//  Created by Alberto on 2/6/18.
//  Copyright © 2018 Alberto Nencioni. All rights reserved.
//

import UIKit

class SuperheroViewController: UIViewController, UICollectionViewDataSource {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var movies: [[String: Any]] = []
  var cellsPerLine: CGFloat = 2
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
     let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
     layout.minimumInteritemSpacing = 0
     layout.minimumLineSpacing = layout.minimumInteritemSpacing
     let interItemTotalSpacing = layout.minimumInteritemSpacing * (cellsPerLine - 1)
     let width = (collectionView.frame.size.width - interItemTotalSpacing) / cellsPerLine
     layout.itemSize = CGSize(width: width, height: (3.0/2.0) * width)
    
    collectionView.dataSource = self
    fetchMovies()
  }
  
  func fetchMovies() {
    let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    let task = session.dataTask(with: request) { (data, response, error) in
      // This will run when the network request returns
      if let error = error {
        print(error.localizedDescription)
      } else if let data = data {
        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        let movies = dataDictionary["results"] as! [[String: Any]]
        self.movies = movies
        self.collectionView.reloadData()
      }
    }
    
    task.resume()
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
    let movie = movies[indexPath.item]
    if let posterPathString = movie[MovieKeys.POSTER_PATH] as? String {
      let baseURLString = "https://image.tmdb.org/t/p/w500"
      let posterURL = URL(string: baseURLString + posterPathString)!
      cell.posterImageView.af_setImage(withURL: posterURL)
    }
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let cell = sender as! UICollectionViewCell
    if let indexPath = collectionView.indexPath(for: cell) {
      let movie = movies[indexPath.row]
      let detailViewController = segue.destination as! DetailViewController
      detailViewController.movie = movie
      // Update colors
      detailViewController.view.backgroundColor = UIColor.black
      detailViewController.titleLabel.textColor = UIColor.white
      detailViewController.releaseDateLabel.textColor = UIColor.white
      detailViewController.overviewLabel.textColor = UIColor.white
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
