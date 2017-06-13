//
//  FirstViewController.swift
//  orbitalSample
//
//  Created by Anusree on 27/5/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var directoryLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var storesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchButtonTouch(_ sender: Any) {
//        let myVC = storyboard?.instantiateViewController(withIdentifier: "DirectoryResultsViewController") as! DirectoryResultsViewController
//        myVC.search = textField.text!
//        navigationController?.pushViewController(myVC, animated: true)
        
        // Check if value from myTextField is not empty

        
        // Instantiate SecondViewController
        let secondViewController = storyboard?.instantiateViewController(withIdentifier: "DirectoryResultsViewController") as! DirectoryResultsViewController
        if textField.text?.isEmpty == true
        {
            secondViewController.search = "No such store exists"
        }
        else{
            secondViewController.search = textField.text
        }
        
        // Take user to SecondViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
        
    }
    

    
    @IBAction func storesButtonTouch(_ sender: Any) {
    }
    
    func isStringEmpty( stringValue:String) -> Bool
    {
        var stringValue = stringValue
        var returnValue = false
        
        if stringValue.isEmpty  == true
        {
            returnValue = true
            return returnValue
        }
        
        // Make sure user did not submit number of empty spaces
        stringValue = stringValue.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if(stringValue.isEmpty == true)
        {
            returnValue = true
            return returnValue
            
        }
        
        return returnValue
        
    }
}

