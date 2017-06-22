//
//  LocationViewController.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 6/22/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    var locationId: String?

    @IBOutlet weak var locationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if locationId !=  "No QR code detected"{
            if let dotRange = locationId?.range(of: " ") {
                locationId?.removeSubrange(dotRange.lowerBound..<(locationId?.endIndex)!)
                print(locationId!)
            }
        }
        locationLabel.text = locationId!
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print(locationLabel.text!)
        if locationId ==  "No QR code detected"{
            let errorMessage = ("QR code invalid")
            self.displayAlertMessage(userMessage: errorMessage)
        }
        else{
            
            
        }
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
