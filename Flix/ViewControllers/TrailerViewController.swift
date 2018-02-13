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
  
  var url_string: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("Video URL is: " + url_string)
    
    let myURL = URL(string: url_string)
    let myRequest = URLRequest(url: myURL!)
    webView.load(myRequest)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
