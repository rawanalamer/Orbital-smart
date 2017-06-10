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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        resultLabel.text = self.selectedStore?.description
        
        /*resultLabel.text = self.selectedStore?.unit
        resultLabel.text = self.selectedStore?.opening
        resultLabel.text = self.selectedStore?.number
        resultLabel.text = self.selectedStore?.website
        resultLabel.text = self.selectedStore?.descrp
        resultLabel.text = self.selectedStore?.diagram*/
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
