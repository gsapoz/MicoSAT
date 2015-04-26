//
//  RoughViewController.swift
//  micoSAT app
//
//  Created by Izza Nawaz on 4/23/15.
//  Copyright (c) 2015 Khagay . Nagdimov. All rights reserved.
//

import UIKit

class RoughViewController: UIViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc: Rough = segue.destinationViewController as! Rough

        if segue.identifier == "mathSegue"{
            vc.subject = "Emath"
        }
        
        if segue.identifier == "readingSegue"{
            vc.subject = "EReading"
        }
        
        if segue.identifier == "writingSegue"{
            vc.subject = "EWriting"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
