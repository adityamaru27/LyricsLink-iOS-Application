//
//  lastview.swift
//  LyricsLink
//
//  Created by Aditya Maru on 2016-05-10.
//  Copyright © 2016 Aditya Maru. All rights reserved.
//

import UIKit


class lastview: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var newstring: String = url_list[rowCounter][1]
        
        var newweststring = newstring.stringByReplacingOccurrencesOfString(":", withString: "%3A")
        
        var url = "https://api.spotify.com/v1/users/\(username)/playlists/\(names[row_counter][1])/tracks?uris=\(newweststring)"
        
        var nsurl = NSURL(string: url)
        
        var request = NSMutableURLRequest(URL: nsurl!)
        
        request.HTTPMethod = "POST"
        
        request.addValue("Bearer \(access_token)", forHTTPHeaderField: "Authorization")
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler:  { (data, response, error) in
            if error != nil{
                print("Error!")
            }
        })
        task.resume()
    }
    
        
        

        // Do any additional setup after loading the view.

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
