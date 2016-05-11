//
//  ViewController.swift
//  LyricsLink
//
//  Created by Aditya Maru on 2016-04-25.
//  Copyright © 2016 Aditya Maru. All rights reserved.
//

import UIKit


var rowCounter = 0
var lyricsLabel = String()


class ViewController: UIViewController {
    
    @IBOutlet weak var lyrics: UITextField!
    
    @IBOutlet weak var heading: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "btnSubmitSegue") {
            var svc = segue.destinationViewController as! TableViewController;
            svc.lyricss = lyrics.text!
        }
    }
    
    
    @IBAction func searchButton(sender: AnyObject)
    {
    }
    
}

