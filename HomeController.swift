//
//  HomeController.swift
//  micoSAT app
//
//  Created by Khagay . Nagdimov on 3/2/15.
//  Copyright (c) 2015 Khagay . Nagdimov. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! ViewController
        if segue.identifier == "mathSegue"{
            vc.subject = 0
        }

        if segue.identifier == "readingSegue"{
            vc.subject = 1
        }
        
        if segue.identifier == "writingSegue"{
            vc.subject = 2
        }
    }
    
    @IBAction func cancelToHomeController(segue:UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
