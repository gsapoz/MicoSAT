//
//  HomeController.swift
//  micoSAT app
//
//  Created by Khagay . Nagdimov on 3/2/15.
//  Copyright (c) 2015 Khagay . Nagdimov. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
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
            let vc: SubjectVC = segue.destinationViewController as! SubjectVC
            vc.mode = "Easy"
            
        }
        else if segue.identifier == "mediumSegue"{
            let vc: SubjectVC = segue.destinationViewController as! SubjectVC
            vc.mode = "Medium"
            
        }
        else if segue.identifier == "advancedSegue"{
            let vc: SubjectVC = segue.destinationViewController as! SubjectVC
            vc.mode = "Advanced"
        }
    }
}
