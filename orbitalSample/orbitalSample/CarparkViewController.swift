//
//  CarparkViewController.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 6/22/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class CarparkViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, HomeModelProtocal {

    @IBOutlet weak var carparkLabel: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var selectLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    var feedItems: NSArray = NSArray()
    var tapped: ((StoreModel) -> Void)?
    var selectedStore : StoreModel = StoreModel()
    var carparkId: String?
    var myCustomViewController: CarViewController = CarViewController(nibName: nil, bundle: nil)

    
    
    /*override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCustomViewController.codeScanned = true
        print(myCustomViewController.codeScanned)

        self.picker.delegate = self
        self.picker.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        
        selectLabel.text = "Choose your destination"
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.picker.reloadAllComponents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if carparkId !=  "No QR code detected"{
            if let dotRange = carparkId?.range(of: " ") {
                carparkId?.removeSubrange(dotRange.lowerBound..<(carparkId?.endIndex)!)
                carparkLabel.text = "You have parked here:"
                let imageUrl = "http://192.168.0.19:8080/Locations/c1.png"
                get_image(imageUrl, locationImage)
            }
        }
        else{
            carparkLabel.text = carparkId!
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
        self.performSegue(withIdentifier: "carparkDirectionSegue", sender: self)
        print("performSegue works")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        // Get reference to the destination view controller
        let detailVC  = segue.destination as! CarparkDirectionViewController
        // Set the property to the selected location so when the view for
        // detail view controller loads, it can access that property to get the feeditem obj
        detailVC.selectedStore = selectedStore
        print("prepareForSegue works")
        

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

    
    
    @IBAction func selectButtonTouch(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        self.performSegue(withIdentifier: "carparkDirectionSegue", sender: self)
        print("performSegue works")
    }
    
    func displayAlertMessage(userMessage: String)
    {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let okAction =  UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil)
    }

}
