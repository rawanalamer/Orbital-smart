//
//  SaveLocationViewController.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 7/14/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class SaveLocationViewController: UIViewController {
    
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var time: UILabel!
    
    var carparkId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if carparkId !=  "No QR code detected"{
            if let dotRange = carparkId?.range(of: " ") {
                carparkId?.removeSubrange(dotRange.lowerBound..<(carparkId?.endIndex)!)
                currentLabel.text = "You have parked here:"
                let imageUrl = "http://192.168.0.19:8080/Locations/c1.png"
                get_image(imageUrl, image)
                
                let date = NSDate()
                var formatter = DateFormatter();
                formatter.dateFormat = "hh:mm";
                let defaultTimeZoneStr = formatter.string(from: date as Date);
                time.text = defaultTimeZoneStr
                
            }
        }
        else{
            currentLabel.text = carparkId!
            let errorMessage = ("QR code invalid")
            self.displayAlertMessage(userMessage: errorMessage)
        }
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
    
}

