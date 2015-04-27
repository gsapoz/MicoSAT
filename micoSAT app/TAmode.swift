//
//  TAmode.swift
//  micoSAT app
//
//  Created by Izza Nawaz on 4/25/15.
//  Copyright (c) 2015 Khagay . Nagdimov. All rights reserved.
//

import UIKit

class TAmode: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "easySegue"{
            let vc: TAsubject = segue.destinationViewController as! TAsubject
            vc.mode = "Easy"
        }
        else if segue.identifier == "mediumSegue"{
            let vc: TAsubject = segue.destinationViewController as! TAsubject
            vc.mode = "Medium"
        }
        else if segue.identifier == "advancedSegue"{
            let vc: TAsubject = segue.destinationViewController as! TAsubject
            vc.mode = "Advanced"
        }
    }
}
