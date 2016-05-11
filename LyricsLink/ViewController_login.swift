//
//  ViewController_login.swift
//  LyricsLink
//
//  Created by Aditya Maru on 2016-05-03.
//  Copyright © 2016 Aditya Maru. All rights reserved.
//

import UIKit

var access_token = String()
var username = String()

class ViewController_login: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!

    @IBAction func login(sender: AnyObject)
    {
        let client_id = "?client_id=5a36c4ca0cc242afa61597624a485c0d"
        
        let redirect_uri = "&redirect_uri=https://google.ca/callback"
        
        let response_type = "&response_type=token"
        
        /*scope = 'playlist-read-private playlist-modify-public playlist-modify-private user-read-email ' \
         'user-read-private user-read-birthdate'*/
        
        let url = "https://accounts.spotify.com/authorize"
        
        let main_url = url + client_id + redirect_uri + response_type + "&scope=playlist-read-private%20playlist-modify-public%20playlist-modify-private%20user-read-email%20user-read-private"
        
        let urlify = NSURL(string: main_url)
        
        let request = NSMutableURLRequest(URL: urlify!)
        
        request.HTTPMethod = "GET"
        
        //self.webView(self.webview, shouldStartLoadWithRequest: request)
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler:  { (data, response, error) in
            
            
            if (error != nil)
            {
                print("Error!")
                
            }
            else
            {
                self.webview.loadRequest(request)
                //self.webView(self.webview, shouldStartLoadWithRequest: request)
                
            }
        })
        task.resume()
    }
    
    @IBAction func validate(sender: AnyObject)
    {
        let u = webview.request!.URL!.absoluteString
        
        let urlParams = u.componentsSeparatedByString("&")
        for x in urlParams
        {
            //print(x)
            let keyValue = x.componentsSeparatedByString("=")
            //print(keyValue.first)
            let key = keyValue.first
            if key == "https://google.ca/callback#access_token"
            {
                access_token = keyValue.last!
            }
        }
        
        let user = "https://api.spotify.com/v1/me"
        
        let nsuser = NSURL(string: user)
        
        var request = NSMutableURLRequest(URL: nsuser!)
        
        request.HTTPMethod = "GET"
        
        request.addValue("Bearer \(access_token)", forHTTPHeaderField: "Authorization")
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler:  { (data, response, error) in
            
            if error != nil
            {
                print("Error!")
            }
            else
            {
                do
                {
                    if let data_1 = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary
                    {
                        username = String(data_1["id"]!)
                        //print(username)
                    }
                    
                }
                catch
                {
                    print("Error!")
                }
                
            }
        })
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
