//
//  Location1ViewController.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 6/24/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class Location1ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, HomeModelProtocal {

    var locationId: String?
    var message: String?
    var feedItems: NSArray = NSArray()
    var tapped: ((StoreModel) -> Void)?
    var selectedStore : StoreModel = StoreModel()
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var diagram: UIImageView!
    @IBOutlet weak var picker: UIPickerView!
    
    let locationURL = URL(string: "http://192.168.0.19:8888/searchLocation.php")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        
        // Do any additional setup after loading the view.
    }
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.picker.reloadAllComponents()
    }
    override func viewDidAppear(_ animated: Bool) {
        
        if message !=  "No QR code detected"{
            
            locationLabel.text = "Your current location:"
            let imageUrl = "http://192.168.0.19:8080/Locations/location\(locationId!).png"
            
            get_image(imageUrl, diagram)
            print(locationId!)
        }
        else{
            locationLabel.text = message!
            let errorMessage = ("QR code invalid")
            self.displayAlertMessage(userMessage: errorMessage)
        }
        
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        let item: StoreModel = feedItems[row] as! StoreModel
        
        return item.name    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return feedItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedStore = feedItems[row] as! StoreModel
        self.performSegue(withIdentifier: "directionSegue", sender: self)
        print("performSegue works")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        print("prepareForSegue works")
        // Get reference to the destination view controller
        let detailVC  = segue.destination as! DirectionViewController
        // Set the property to the selected location so when the view for
        // detail view controller loads, it can access that property to get the feeditem obj
        detailVC.selectedStore = selectedStore
        detailVC.locationId = locationId
        
    }
    
    func get_image(_ url_str:String, _ imageView:UIImageView)
    {
        
        let url:URL = URL(string: url_str)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url, completionHandler: {
            (
            data, response, error) in
            
            
            if data != nil
            {
                let image = UIImage(data: data!)
                
                if(image != nil)
                {
                    
                    DispatchQueue.main.async(execute: {
                        
                        imageView.image = image
                        imageView.alpha = 0
                        
                        UIView.animate(withDuration: 2.5, animations: {
                            imageView.alpha = 1.0
                        })
                        
                    })
                    
                }
                
            }
            
            
        })
        
        task.resume()
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
    @IBAction func selectButtonTouch(_ sender: Any) {
        // Set selected location to var
        // Manually call segue to detail view controller
        self.performSegue(withIdentifier: "directionSegue", sender: self)
        print("performSegue works")
    }

}
