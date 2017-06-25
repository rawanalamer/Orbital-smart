//
//  CarViewController.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 6/25/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {

    
    @IBOutlet weak var carLocation: UIImageView!
    @IBOutlet weak var carLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let errorMessage = ("You have not scanned a QR code to record your car's location!")
        self.displayAlertMessage(userMessage: errorMessage)

        
        // Do any additional setup after loading the view.
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

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
