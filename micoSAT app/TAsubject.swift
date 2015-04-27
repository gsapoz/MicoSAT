//
//  TAsubject.swift
//  micoSAT app
//
//  Created by Izza Nawaz on 4/25/15.
//  Copyright (c) 2015 Khagay . Nagdimov. All rights reserved.
//

import UIKit

class TAsubject: UIViewController {
    var mode: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "mathSegue"{
            let vc: TAquestions = segue.destinationViewController as! TAquestions
            if mode == "Easy"{
                vc.subject = "EMath"
            }
            else if mode == "Medium"{
                vc.subject = "MMath"}
            else{
                vc.subject = "AMath"}
            
        }
        else if segue.identifier == "readingSegue"{
            let vc: TAquestions = segue.destinationViewController as! TAquestions
            if mode == "Easy"{
                vc.subject = "EReading"}
            else if mode == "Medium"{
                vc.subject = "MReading"}
            else{
                vc.subject = "AReading"}
            
        }
        else if segue.identifier == "writingSegue"{
            let vc: TAquestions = segue.destinationViewController as! TAquestions
            if mode == "Easy"{
                vc.subject = "EWriting"}
            else if mode == "Medium"{
                vc.subject = "MWriting"}
            else{
                vc.subject = "AWriting"}
        }
        
        
    }
    

}
