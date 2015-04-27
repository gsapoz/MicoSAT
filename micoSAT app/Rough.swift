//
//  Rough.swift
//  micoSAT app
//
//  Created by Izza Nawaz on 4/23/15.
//  Copyright (c) 2015 Khagay . Nagdimov. All rights reserved.
//

import UIKit
import Parse
import Bolts


class Rough: UIViewController {

    @IBOutlet weak var Q: UILabel!
    @IBOutlet weak var A1: UIButton!
    @IBOutlet weak var A2: UIButton!
    @IBOutlet weak var A3: UIButton!
    @IBOutlet weak var A4: UIButton!
    @IBOutlet weak var A5: UIButton!
    
    
    var points: Int = 0;
    var maxPoints: Int = 0;
    var count: Int = 1;
    var subject:String = "";
    var Answer:String = "";
    var gameOver:Bool = false;
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    func nextonright() {
        
        if(count==6){
            self.performSegueWithIdentifier("gotoend", sender: self)
        }
        A1.backgroundColor = UIColor.whiteColor()
        A2.backgroundColor = UIColor.whiteColor()
        A3.backgroundColor = UIColor.whiteColor()
        A4.backgroundColor = UIColor.whiteColor()
        A5.backgroundColor = UIColor.whiteColor()
        
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(count==6){
            self.performSegueWithIdentifier("gotoend", sender: self)
        }
        
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

    @IBAction func A1pressed(sender: AnyObject) {
        if A1.titleLabel?.text == Answer{
            points += 10;
            pointsLabel.text = String(points)
            A1.backgroundColor = UIColor.greenColor()
            nextonright()
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
            nextonright()
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
            nextonright()
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
            nextonright()
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
            nextonright()
        }
        else{
            A5.backgroundColor = UIColor.redColor()
        }
    }
    
    func endGame() {
        
        gameOver = true
        var gameOverText = "Game Over"
        
        var answerButtons = [A1, A2,  A3 , A4, A5]
        var i = 0
        
        for i in 0..<answerButtons.count {
            answerButtons[i].hidden = true
        }
        
        Q.text = gameOverText
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
