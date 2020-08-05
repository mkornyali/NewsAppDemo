//
//  SafariViewController.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/16/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit
import WebKit
class SafariViewController: UIViewController, WKNavigationDelegate  {
    var newsURL:String!
    let webView = WKWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        webView.frame = view.bounds
       
        webView.navigationDelegate = self
        
        let url = URL(string: newsURL!)
        let urlRequest = URLRequest(url: (url ?? URL(string: "www.google.com"))!)
        webView.load(urlRequest)
        webView.allowsBackForwardNavigationGestures = true
       // webView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        view.addSubview(webView)
        //view = webView
       // self.hideActivityIndicator()
        
        if webView.isLoading {
             showActivityIndicator()
        }
      
    }
    
   func webView(_ webView: WKWebView, didFinish  navigation: WKNavigation!)
    {
       hideActivityIndicator()
    }
}
extension String {
var fixedArabicURL: String?  {
       return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics
           .union(CharacterSet.urlPathAllowed)
           .union(CharacterSet.urlHostAllowed))
   } }
