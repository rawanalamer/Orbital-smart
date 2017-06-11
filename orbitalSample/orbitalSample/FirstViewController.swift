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

    @IBAction func searchButtonTouch(_ sender: UIStoryboardSegue) {
        let viewControllerB = DirectoryResultsViewController()
        if textField.text == nil{
            viewControllerB.search = "Store does not exist"
        }
        else{
            viewControllerB.search = textField.text!
        }
        viewControllerB.delegate = self
        navigationController?.pushViewController(viewControllerB, animated: true)
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var DestViewController : DirectoryResultsViewController = segue.destination as! DirectoryResultsViewController
//        DestViewController.search = textField.text!
//        
//    }
    

    
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

