//
//  TableViewController.swift
//  LyricsLink
//
//  Created by Aditya Maru on 2016-04-27.
//  Copyright © 2016 Aditya Maru. All rights reserved.
//

import UIKit

var artist = [String]()
var songs = [String]()
var url_list = [[String(), String()]]
var add = false
var names = [[AnyObject!(), String()]]
var index = 0
var x = 0

class TableViewController: UITableViewController {
    var lyricss = String()
    
    @IBAction func addplaylist(sender: AnyObject)
    {
        
     print("lol")
    }



    override func viewDidLoad()
    {
        super.viewDidLoad()
        //let lpgr = UILongPressGestureRecognizer(target: self, action: "longPress:")
        //self.view.addGestureRecognizer(lpgr)
        print(lyricss)
        
        //still cant figure out!!!
        if(artist.count == 0)
        {
            starter(lyricss)
        }
    }
    
    
    func starter( lyricsLabel : String)
    {
        let newlyricsLabel:String = lyricsLabel.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        
        if isStringEmpty(lyricsLabel) == true
        {
            return
            
        }
        else
        {
            let url = "https://api.musixmatch.com/ws/1.1/track.search"
            
            let urlwithparams = url + "?apikey=425cebdbe74fbb9dea718acdb613e0e8&q_lyrics=\(newlyricsLabel)&s_track_rating=desc&s_artist_rating=desc&format=json"
            
            let myurl = NSURL(string: urlwithparams)
            
            let request = NSMutableURLRequest(URL: myurl!)
            
            request.HTTPMethod = "GET"
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) in
                
                if error != nil
                {
                    print("Error!")
                }
                else
                {
                    do
                    {
                        if let convertedJSON = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary
                        {
                            if let filtered_data = (convertedJSON["message"]!["body"]!!["track_list"]) as? [[String:AnyObject]]
                            {
                                self.initialize(filtered_data)
                            }
                            
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
        
        
    }
    
    
    
    func initialize( filtered_data : [[String:AnyObject]])
    {
        var id = [String]()
        for var items in filtered_data
        {
            if let spotify_id = items["track"]!["track_spotify_id"] as? String
            {
                id.append(spotify_id)
                
            }
            
        }
        var new_list = dedup(id)
        previewer(new_list)
        
    }
    
    func previewer( spotify_id : [String])
    {
        var serial_number = 0
        let spotify_url = "https://api.spotify.com/v1/tracks/"
        
        for var x in spotify_id
        {
            
            
            let url_with_pars = spotify_url + x
            
            let myurl_1 = NSURL(string: url_with_pars)
            
            
            let request_1 = NSMutableURLRequest(URL: myurl_1!)
            
            request_1.HTTPMethod = "GET"
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request_1, completionHandler: { (data, response, error) in
                
                
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
                            self.imp(data_1)
                            self.do_table_refresh()
                            
                        }
                        else
                        {
                            print("error!")
                        }
                    }
                    catch
                    {
                        print("error")
                    }
                }
            })
            task.resume()
        }
        
        
    }
    
    
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }
    
    
    func imp( data_1:NSDictionary)
    {
        if let artist_name = data_1["artists"]![0]["name"] as? String
        {
            artist.append(artist_name)
        }
        else
        {
            print("artist error")
        }
        
        if let song_name = data_1["name"] as? String
        {
            songs.append(song_name)
            
        }
        else
        {
            print("song error")
        }
        
        if let url = data_1["preview_url"] as? String
        {
            if let url_1 =  data_1["uri"] as? String
            {
                url_list.append([url, url_1])
                
            }
            else
            {
                print("url error")
                
            }
            
        }
        else
        {
            var url_2 =  data_1["uri"] as? String
            url_list.append(["null", url_2!])
            
            
        }
        
    }
    
    
    func dedup( duplicate:[String]) -> [String]
    {
        var new_list = [String]()
        for var x in duplicate
        {
            let whitespace = NSCharacterSet.whitespaceCharacterSet()
            
            let range = x.rangeOfCharacterFromSet(whitespace)
            
            if let test = range
            {
                continue
            }
            else
            {
                if !new_list.contains(x) && x != ""
                {
                    new_list.append(x)
                }
            }
        }
        return new_list
        
    }
    
    func isStringEmpty( stringValue:String) -> Bool
    {
        var returnValue = false
        
        var stringValue = stringValue.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if stringValue.isEmpty == true
        {
            returnValue = true
            
            return returnValue
        }
        else
        {
            return returnValue
            
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }
    
    /*override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
     
     rowCounter = indexPath.row
     
     return indexPath
     }*/
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel!.text = artist[indexPath.row] + ": " + songs[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        rowCounter = indexPath.row + 1
        //print(rowCounter)
        return indexPath
        
    }
    
    
    /*func longPress(gesturerecognizer:UIGestureRecognizer)
    {
        if gesturerecognizer.state == UIGestureRecognizerState.Began
        {
            let location = gesturerecognizer.locationInView(self.view)
            
            if let indexpath = tableView.indexPathForRowAtPoint(location)
            {
                var playlistcall = "https://api.spotify.com/v1/me/playlists"
                
                var url = NSURL(string:playlistcall)
                
                var request = NSMutableURLRequest(URL: url!)
                
                request.HTTPMethod = "GET"
                
                request.addValue("Bearer \(access_token)", forHTTPHeaderField: "Authorization")
                
                let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) in
                    
                    if error != nil
                    {
                        print("Error!")
                    }
                    else
                    {
                        do
                        {
                            if let data_3 = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary
                                
                            {
                                while (index < data_3.count)
                                {
                                    var play_list = data_3["items"] as! NSArray
                                    names.append(play_list[index]["name"])
                                }
                                
                               //self.performSegueWithIdentifier("show", sender: self.addplaylist)
                            }
                            else
                            {
                                print("Error")
                            }
                        }
                        catch
                        {
                            print("Error")
                        }
                        
                    }
                })
                task.resume()
                
            }
        }
    }
    */
    
    
    
    
   /* func parse(data:AnyObject)
    {
        index = index + 1
    }*/
}




/*
 // Override to support conditional editing of the table view.
 override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
 if editingStyle == .Delete {
 // Delete the row from the data source
 tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
 } else if editingStyle == .Insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


