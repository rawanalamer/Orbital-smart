//
//  CalculateParkingFees.swift
//  orbitalSample
//
//  Created by Anusree on 2/7/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import Foundation
import UIKit

class CalculateParkingFees: UIViewController{
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var fareLabel: UILabel!

    override func viewDidLoad() {
        
        let methodStart = Date()
        
        let methodFinish = Date()
        let executionTime = methodFinish.timeIntervalSince(methodStart)

        
        timeLabel.text = "\(executionTime)"
        
        //$1.20 for 1st hr, $0.60 for next subsequent 30min from 7am to 6pm
        
        fareLabel.text = "$0.00"
        
        
        print("Execution time: \(executionTime)")
        
        
    }

}
