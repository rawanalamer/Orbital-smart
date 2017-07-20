//
//  SaveLocationViewController.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 7/14/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class SaveLocation1ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var message: String?
    var carparkId: String?
    static var imageUrl: String?
    static var id: String?
    static var time: NSDate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {

        if message! !=  "No QR code detected"{
            currentLabel.text = "You have parked here:"


            SaveLocation1ViewController.imageUrl = "http://192.168.0.152:8080/Locations/location\(carparkId!).png"

            SaveLocation1ViewController.id = carparkId
            get_image(SaveLocation1ViewController.imageUrl!, image)
            
            let date = NSDate()
            SaveLocation1ViewController.time = date
            var formatter = DateFormatter();
            formatter.dateFormat = "hh:mm";
            let defaultTimeZoneStr = formatter.string(from: date as Date);
            time.text = "Time parked: " + defaultTimeZoneStr
            
        
           
            
            
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
    
    func getImageUrl()  -> String?{
        return SaveLocation1ViewController.imageUrl
    }
    func getId()  -> String?{
        return SaveLocation1ViewController.id
    }
    
    func getTime()  -> NSDate!{
        return SaveLocation1ViewController.time
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
}


