//
//  TAquestions.swift
//  micoSAT app
//
//  Created by Izza Nawaz on 4/25/15.
//  Copyright (c) 2015 Khagay . Nagdimov. All rights reserved.
//

import UIKit
import Parse

class TAquestions: UIViewController {
    
    @IBOutlet weak var Q: UILabel!
    @IBOutlet weak var A1: UIButton!
    @IBOutlet weak var A2: UIButton!
    @IBOutlet weak var A3: UIButton!
    @IBOutlet weak var A4: UIButton!
    @IBOutlet weak var A5: UIButton!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var timerL: UILabel!
    var points: Int = 0;
    var count: Int = 1;
    var subject:String = "";
    var Answer:String = "";
    
    var timer = NSTimer()
    var counter: Int = 0

    
   // @IBOutlet weak var pointsLabel: UILabel!
    func timedNext(){
        A1.backgroundColor = UIColor.whiteColor()
        A2.backgroundColor = UIColor.whiteColor()
        A3.backgroundColor = UIColor.whiteColor()
        A4.backgroundColor = UIColor.whiteColor()
        A5.backgroundColor = UIColor.whiteColor()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
        
        var query = PFQuery(className:subject)
        query.whereKey("qnum", equalTo:count++)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        self.Q.text = object["Q"] as? String
                        
                        self.A1.setTitle(object["A1"] as? String!, forState: UIControlState.Normal)
                        self.A2.setTitle(object["A2"] as? String!, forState: UIControlState.Normal)
                        self.A3.setTitle(object["A3"] as? String!, forState: UIControlState.Normal)
                        self.A4.setTitle(object["A4"] as? String!, forState: UIControlState.Normal)
                        self.A5.setTitle(object["A5"] as? String!, forState: UIControlState.Normal)
                        self.Answer = (object["CA"] as? String!)!
                    }
                }
            } else {
                // Log details of the failure
                println("Error: \(error) \(error!.userInfo!)")
            }
        }
        
    }

    
    @IBAction func nextPressed(sender: AnyObject) {
        A1.backgroundColor = UIColor.whiteColor()
        A2.backgroundColor = UIColor.whiteColor()
        A3.backgroundColor = UIColor.whiteColor()
        A4.backgroundColor = UIColor.whiteColor()
        A5.backgroundColor = UIColor.whiteColor()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
        
        var query = PFQuery(className:subject)
        query.whereKey("qnum", equalTo:count++)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        self.Q.text = object["Q"] as? String
                        
                        self.A1.setTitle(object["A1"] as? String!, forState: UIControlState.Normal)
                        self.A2.setTitle(object["A2"] as? String!, forState: UIControlState.Normal)
                        self.A3.setTitle(object["A3"] as? String!, forState: UIControlState.Normal)
                        self.A4.setTitle(object["A4"] as? String!, forState: UIControlState.Normal)
                        self.A5.setTitle(object["A5"] as? String!, forState: UIControlState.Normal)
                        self.Answer = (object["CA"] as? String!)!
                    }
                }
            } else {
                // Log details of the failure
                println("Error: \(error) \(error!.userInfo!)")
            }
        }
        
    }

    @IBAction func back(sender: AnyObject) {
        count = 0;
    }
    func updateTime(){
        timerL.text = "Time: "+String(++counter)
        if counter == 20{
            resetTimer()
            timedNext()
        }
    }
    func resetTimer(){
        timer.invalidate()
        counter = 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
        //timerL.text = String(_cocoaString: timer)
        
        var query = PFQuery(className:subject)
        query.whereKey("qnum", equalTo:count++)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        self.Q.text = object["Q"] as? String
                        
                        self.A1.setTitle(object["A1"] as? String!, forState: UIControlState.Normal)
                        self.A2.setTitle(object["A2"] as? String!, forState: UIControlState.Normal)
                        self.A3.setTitle(object["A3"] as? String!, forState: UIControlState.Normal)
                        self.A4.setTitle(object["A4"] as? String!, forState: UIControlState.Normal)
                        self.A5.setTitle(object["A5"] as? String!, forState: UIControlState.Normal)
                        self.Answer = (object["CA"] as? String!)!
                        
                    }
                }
            } else {
                // Log details of the failure
                println("Error: \(error) \(error!.userInfo!)")
            }
        }
        
    }
    @IBAction func A1presses(sender: AnyObject) {
        if A1.titleLabel?.text == Answer{
            points += 10;
            pointsLabel.text = String(points)
            A1.backgroundColor = UIColor.greenColor()
        }
        else{
            A1.backgroundColor = UIColor.redColor()
        }
    }
    
    @IBAction func A2pressed(sender: AnyObject) {
        if A2.titleLabel?.text == Answer{
            points += 10;
            pointsLabel.text = String(points)
            A2.backgroundColor = UIColor.greenColor()
        }
        else{
            A2.backgroundColor = UIColor.redColor()
        }
    }
    
    @IBAction func A3pressed(sender: AnyObject) {
        if A3.titleLabel?.text == Answer{
            points += 10;
            pointsLabel.text = String(points)
            A3.backgroundColor = UIColor.greenColor()
        }
        else{
            A3.backgroundColor = UIColor.redColor()
        }
    }
    
    @IBAction func A4pressed(sender: AnyObject) {
        if A4.titleLabel?.text == Answer{
            points += 10;
            pointsLabel.text = String(points)
            A4.backgroundColor = UIColor.greenColor()
        }
        else{
            A4.backgroundColor = UIColor.redColor()
        }
    }
    
    @IBAction func A5pressed(sender: AnyObject) {
        if A5.titleLabel?.text == Answer{
            points += 10;
            pointsLabel.text = String(points)
            A5.backgroundColor = UIColor.greenColor()
        }
        else{
            A5.backgroundColor = UIColor.redColor()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
