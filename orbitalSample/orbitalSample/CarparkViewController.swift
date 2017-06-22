//
//  CarparkViewController.swift
//  orbitalSample
//
//  Created by Anusree on 22/6/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class CarparkViewController: UIViewController {
    
    var carparkId: String?
    
    @IBOutlet weak var carparkLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if carparkId !=  "No QR code detected"{
            if let dotRange = carparkId?.range(of: " ") {
                carparkId?.removeSubrange(dotRange.lowerBound..<(carparkId?.endIndex)!)
                print(carparkId!)
            }
        }
        carparkLabel.text = carparkId!
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print(carparkLabel.text!)
        if carparkId ==  "No QR code detected"{
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
