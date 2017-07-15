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
    

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var fareLabel: UILabel!
    var parkedTime: NSDate!
    var totalFare: Double!
    
    var carpark: SaveLocation1ViewController = SaveLocation1ViewController(nibName: nil, bundle: nil)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        let currentTime = NSDate()
        parkedTime = carpark.getTime()
        let interval = currentTime.timeIntervalSince(parkedTime as Date)
        print(interval)
        totalFare = (interval/1800)*1.00
        totalFare = Double(round(100*totalFare)/100)
        print(totalFare)
        
        fareLabel.text = "$\(totalFare!)"
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlertMessage(userMessage: String)
    {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let okAction =  UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil)
    }

}
