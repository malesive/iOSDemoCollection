//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by June801 on 16/1/18.
//  Copyright © 2016年 June801. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var mkWebView: WKWebView!
    
    override func loadView() {
        super.loadView()
        
        mkWebView = WKWebView()
        view = mkWebView
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("123")
        
//        let url = NSURL(string: "http://www.d5yuansu.com/2016/01/16/102060.html")
//        if let unwrapedUrl = url {
//            let urlReq = NSURLRequest(URL: unwrapedUrl)
//            mkWebView.loadRequest(urlReq)
//        }
//        var urlReq = NSURLRequest(URL: url)
//        mkWebView.loadRequest(urlReq)
//        mkWebView.backgroundColor = UIColor.grayColor()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let url = NSURL(string: "https://www.baidu.com/")
        if let unwrapedUrl = url {
            let urlReq = NSURLRequest(URL: unwrapedUrl)
            mkWebView.loadRequest(urlReq)
        }
    }
}
