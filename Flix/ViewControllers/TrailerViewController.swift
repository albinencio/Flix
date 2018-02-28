//
//  TrailerViewController.swift
//  Flix
//
//  Created by Alberto on 2/12/18.
//  Copyright © 2018 Alberto Nencioni. All rights reserved.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController, WKUIDelegate {
  
  @IBOutlet weak var webView: WKWebView!
  
  var movie: Movie!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.fetchTrailer()
  }
  
  func fetchTrailer() {
    let request = URLRequest(url: (movie?.trailerURL)!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
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
        if let myURL = URL(string: "https://www.youtube.com/watch?v=" + key) {
          let myRequest = URLRequest(url: myURL)
          self.webView.load(myRequest)
        }
      }
    }
    
    task.resume()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
