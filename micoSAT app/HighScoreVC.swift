//
//  HighScoreVC.swift
//  micoSAT app
//
//  Created by GaryS on 4/22/15.
//  Copyright (c) 2015 Khagay . Nagdimov. All rights reserved.
//

import UIKit
import Parse

class HighScoreVC: UIViewController {
    
    @IBOutlet weak var n1: UILabel!
    @IBOutlet weak var n2: UILabel!
    @IBOutlet weak var n3: UILabel!
    @IBOutlet weak var n4: UILabel!
    @IBOutlet weak var n5: UILabel!
    @IBOutlet weak var s1: UILabel!
    @IBOutlet weak var s2: UILabel!
    @IBOutlet weak var s3: UILabel!
    @IBOutlet weak var s4: UILabel!
    @IBOutlet weak var s5: UILabel!
    
    var array = [Int:String]()
    var count: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var query:PFQuery=PFQuery(className: "_User");
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects as? [PFObject] {
                    for object in objects {
                    var name = object.objectForKey("username") as! String;
                    var highscore = object.objectForKey("highscore") as! Int
                    self.array[highscore] = name
                    }
                }
                for (score, name) in self.array{
                    self.s1.text = String(score)
                    self.n1.text = name
                }
            }
        }
    }
}
