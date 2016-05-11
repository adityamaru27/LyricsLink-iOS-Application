//
//  TableViewController_playlist.swift
//  LyricsLink
//
//  Created by Aditya Maru on 2016-05-07.
//  Copyright © 2016 Aditya Maru. All rights reserved.
//

import UIKit
var l = 0

var row_counter = 0

class TableViewController_playlist: UITableViewController {
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                        var number = data_3["total"]
                        while (index < (number as! Int))
                        {
                            var play_list = data_3["items"] as! NSArray
                            //print(play_list)
                            names.append([play_list[index]["name"], play_list[index]["id"]])
                            //print(play_list[index]["id"])
                            //id.append(play_list[index]["id"])
                            self.do_table_refresh()
                            //id.append(play_list[index]["id"])
                            index = index + 1
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
        /*while (x < names.count)
        {
            table.reloadData()
            l = l + 1
        }*/

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
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
        return names.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellulose", forIndexPath: indexPath)
        cell.textLabel!.text = String(names[indexPath.row][0])
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        row_counter = indexPath.row
        //print(row_counter)
        return indexPath
        
    }



    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

}
