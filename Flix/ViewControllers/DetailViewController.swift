//
//  DetailViewController.swift
//  Flix
//
//  Created by Alberto on 2/6/18.
//  Copyright © 2018 Alberto Nencioni. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var backdropImageView: UIImageView!
  @IBOutlet weak var posterImageView: UIImageView!
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var releaseDateLabel: UILabel!
  @IBOutlet weak var overviewLabel: UILabel!
  
  var movie: Movie!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let movie = movie {
      titleLabel.text = movie.title
      releaseDateLabel.text = movie.releaseDate
      overviewLabel.text = movie.overview
      backdropImageView.af_setImage(withURL: movie.backdropURL!)
      posterImageView.af_setImage(withURL: movie.posterURL!)
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let trailerViewController = segue.destination as! TrailerViewController
    trailerViewController.movie = self.movie
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
