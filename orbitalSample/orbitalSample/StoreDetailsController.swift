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
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var openingLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var descrpTextView: UITextView!
    @IBOutlet weak var diagramImage: UIImageView!
    var lastScaleFactor: CGFloat!
    var factor: CGFloat!
    var pinchGesture = UIPinchGestureRecognizer()
    
    @IBAction func pinchRecognised(sender:UIPinchGestureRecognizer) {
        print("pinch recognised")
        lastScaleFactor = 1
        factor = sender.scale
        
        if (factor>1){
            diagramImage.transform = CGAffineTransform(scaleX: lastScaleFactor * (factor-1), y: lastScaleFactor * (factor-1))
        }
        else{
            diagramImage.transform = CGAffineTransform(scaleX: lastScaleFactor * (factor), y: lastScaleFactor * (factor))
        }
        if(sender.state == UIGestureRecognizerState.ended)
        {
            if (factor>1){
                lastScaleFactor = lastScaleFactor + factor - 1
            }
            else{
                lastScaleFactor = lastScaleFactor * factor
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = "Name: " + (self.selectedStore?.name)!
        unitLabel.text = "Unit: " + (self.selectedStore?.unit)!
        openingLabel.text = "Opening Hours: " + (self.selectedStore?.opening)!
        websiteLabel.text = "Website: " + (self.selectedStore?.website)!
        numberLabel.text = "Number: " + (self.selectedStore?.number)!
        descrpTextView.text = "About Us: " + (self.selectedStore?.descrp)!
        
        diagramImage.isUserInteractionEnabled = true
        let imageURL = self.selectedStore?.diagram
        get_image(imageURL!, diagramImage)
        
        self.pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(StoreDetailsController.pinchRecognised(sender:)))

        
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
    

    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
