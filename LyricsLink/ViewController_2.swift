//
//  ViewController_2.swift
//  LyricsLink
//
//  Created by Aditya Maru on 2016-04-28.
//  Copyright © 2016 Aditya Maru. All rights reserved.
//

import UIKit
//var id = [String]()

class ViewController_2: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = url_list[rowCounter][0]
        
        let id = url_list[rowCounter][1]
        
        if(url == "null")
        {
            print("No preview")
        }
        else
        {
            let nsurl = NSURL(string: url_list[rowCounter][0])
            
            let request = NSURLRequest(URL: nsurl!)
            
            webview.loadRequest(request)
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
