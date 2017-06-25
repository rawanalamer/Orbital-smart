//
//  ThirdViewController.swift
//  orbitalSample
//
//  Created by Anusree on 13/6/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    
    @IBAction func findButtonTouch(_ sender: Any) {
    }
    @IBAction func calculateButtonTouch(_ sender: Any) {
    }
    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
}
