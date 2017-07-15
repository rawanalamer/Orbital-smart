//
//  CarparkDirectionsViewController.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 7/15/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class CarparkDirectionsViewController: UIViewController {

    @IBOutlet weak var currentLable: UILabel!
    @IBOutlet weak var directionsImage: UIImageView!
    var locationId: String?
    var message: String?
    var carpark: SaveLocation1ViewController = SaveLocation1ViewController(nibName: nil, bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentLable.lineBreakMode = NSLineBreakMode.byWordWrapping
        currentLable.numberOfLines = 0
        if message! !=  "No QR code detected"{
            
            currentLable.text = "Directions to your car from your current location:"
            let carLocation = carpark.getId()
            let imageUrl = "http://192.168.0.19:8080/directions_to_carprk/location\(locationId!)_\(carLocation!).png"
            get_image(imageUrl, directionsImage)
        }
        else{
            currentLable.text = message!
            let errorMessage = ("QR code invalid")
            self.displayAlertMessage(userMessage: errorMessage)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
