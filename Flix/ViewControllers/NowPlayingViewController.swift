//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by Alberto on 1/29/18.
//  Copyright © 2018 Alberto Nencioni. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  var movies: [Movie] = []
  var refreshControl: UIRefreshControl!
  
  override func viewWillAppear(_ animated: Bool) {
    if let index = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: index, animated: true)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.separatorInset = .zero
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 50
    
    refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
    tableView.insertSubview(refreshControl, at: 0)
    
    fetchMovies()
  }
  
  @objc func didPullToRefresh(_ refreshControl: UIRefreshControl) {
    fetchMovies()
  }
  
  func fetchMovies() {
    self.activityIndicator.startAnimating()
    MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
      if let movies = movies {
        self.movies = movies
        self.tableView.reloadData()
        self.activityIndicator.stopAnimating()
        self.refreshControl.endRefreshing()
      }
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count;
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
    cell.movie = movies[indexPath.row]
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let cell = sender as! UITableViewCell
    if let indexPath = tableView.indexPath(for: cell) {
      let movie = movies[indexPath.row]
      let detailViewController = segue.destination as! DetailViewController
      detailViewController.movie = movie
      // Update colors
      detailViewController.view.backgroundColor = UIColor.white
      detailViewController.titleLabel.textColor = UIColor.black
      detailViewController.releaseDateLabel.textColor = UIColor.black
      detailViewController.overviewLabel.textColor = UIColor.black
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
}
