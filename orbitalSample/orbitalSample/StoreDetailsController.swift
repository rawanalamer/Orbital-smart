//
//  StoreDetailsController.swift
//  orbitalSample
//
//  Created by Anusree on 10/6/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class StoreDetailsController: UIViewController {
    var selectedStore : StoreModel?
    var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func viewDidAppear() {
        resultLabel.text = "hello"
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
