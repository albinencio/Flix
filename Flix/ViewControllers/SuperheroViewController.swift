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
  
  var movies: [Movie] = []
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
    MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
      if let movies = movies {
        self.movies = movies
        self.collectionView.reloadData()
      }
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
    let movie = movies[indexPath.item]
    if movie.posterURL != nil {
      cell.posterImageView.af_setImage(withURL: movie.posterURL!)
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
