//
//  MovieCell.swift
//  Flix
//
//  Created by Alberto on 1/30/18.
//  Copyright © 2018 Alberto Nencioni. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var overviewLabel: UILabel!
  @IBOutlet weak var posterImageView: UIImageView!
  
  var movie: Movie! {
    willSet(movie) {
      self.titleLabel.text = movie.title
      self.overviewLabel.text = movie.overview
      self.posterImageView.af_setImage(withURL: movie.posterURL!)
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
