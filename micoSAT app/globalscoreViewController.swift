//
//  globalscoreViewController.swift
//  micoSAT app
//
//  Created by Izza Nawaz on 4/26/15.
//  Copyright (c) 2015 Khagay . Nagdimov. All rights reserved.
//

import UIKit
import Parse

class globalscoreViewController: UIViewController {
    
    var array = [Int: String]()
    var arr = [Int]()
    var count: Int = 0;

    @IBOutlet weak var n1: UILabel!
    @IBOutlet weak var n2: UILabel!
    @IBOutlet weak var n3: UILabel!
    @IBOutlet weak var n4: UILabel!
    @IBOutlet weak var n5: UILabel!
    @IBOutlet weak var n6: UILabel!
    
    @IBOutlet weak var s1: UILabel!
    @IBOutlet weak var s2: UILabel!
    @IBOutlet weak var s3: UILabel!
    @IBOutlet weak var s4: UILabel!
    @IBOutlet weak var s5: UILabel!
    @IBOutlet weak var s6: UILabel!
    

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
            }
            for (score,name) in self.array{
                self.arr.append(score)
            }
            sort(&self.arr)
            self.n1.text = self.array[self.arr[5]]
            self.s1.text = String(self.arr[5])
            self.n2.text = self.array[self.arr[4]]
            self.s2.text = String(self.arr[4])
            self.n3.text = self.array[self.arr[3]]
            self.s3.text = String(self.arr[3])
            self.n4.text = self.array[self.arr[2]]
            self.s4.text = String(self.arr[2])
            self.n5.text = self.array[self.arr[1]]
            self.s5.text = String(self.arr[1])
            self.n6.text = self.array[self.arr[0]]
            self.s6.text = String(self.arr[0])
    }
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
