//
//  StoreDetailsController.swift
//  orbitalSample
//
//  Created by Anusree on 10/6/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import Foundation
import UIKit

class StoreDetailsController: UIViewController {
    
    var selectedStore : StoreModel?
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var openingLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var descrpLabel: UILabel!
    @IBOutlet weak var diagramLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = "Name: " + (self.selectedStore?.name)!
        unitLabel.text = "Unit: " + (self.selectedStore?.unit)!
        openingLabel.text = "Opening Hours: " + (self.selectedStore?.opening)!
        websiteLabel.text = "Website: " + (self.selectedStore?.website)!
        numberLabel.text = "Number: " + (self.selectedStore?.number)!
        descrpLabel.text = "About Us: " + (self.selectedStore?.descrp)!
        descrpLabel.sizeToFit()
        diagramLabel.text = self.selectedStore?.diagram
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
