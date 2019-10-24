//
//  VFViewController.swift
//  Noeglen
//
//  Created by Milishia Moradi on 10/10/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import Foundation
import WebKit


class VFViewController: UIViewController {
    

    @IBOutlet weak var webView1: WKWebView!
    @IBOutlet weak var webView2: WKWebView!
    @IBOutlet weak var webView3: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getVideo1(videoCode: "yN5N6tae0G0")
        getVideo2(videoCode: "kyci1wyxpOc")
        getVideo3(videoCode: "Do7Nai2oSZU")
    }
    
    
    func getVideo1(videoCode: String){
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)" )
        
            webView1.load(URLRequest(url: url!))
        
    }
    
    func getVideo2(videoCode: String){
           let url = URL(string: "https://www.youtube.com/embed/\(videoCode)" )
           
           webView2.load(URLRequest(url: url!))
           
       }
    
    func getVideo3(videoCode: String){
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)" )
        
        webView3.load(URLRequest(url: url!))
        
    }
    
    
}
