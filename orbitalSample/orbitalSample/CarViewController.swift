//
//  CarViewController.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 6/25/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class CarViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var directionButton: UIButton!
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var carLocation: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var codeScanned: Bool!
    var carpark: SaveLocation1ViewController = SaveLocation1ViewController(nibName: nil, bundle: nil)

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
        let url = carpark.getImageUrl()
        directionButton.titleLabel?.textAlignment = NSTextAlignment.center
        if url == nil{
            let errorMessage = ("You have not scanned a QR code to record your car's location!")
            self.displayAlertMessage(userMessage: errorMessage)
        }
        else{
            let imageUrl = url!
            get_image(imageUrl, carLocation)
          
        }

        
        // Do any additional setup after loading the view.
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
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return carLocation
    }

}
