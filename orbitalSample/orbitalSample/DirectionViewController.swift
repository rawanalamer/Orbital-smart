//
//  DirectionViewController.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 6/24/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class DirectionViewController: UIViewController, UIScrollViewDelegate {
    
    var selectedStore : StoreModel?
    var locationId : String?
    
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var directionImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        storeLabel.text = "Directions to " + (self.selectedStore?.name)!
        
        let str = (self.selectedStore?.name)!
        let trimmedString = str.replacingOccurrences(of: " ", with: "")
        let urlImage = "http://192.168.0.152:8080/directions/location\(locationId!)_" + trimmedString + ".png"
        print(urlImage)
        get_image(urlImage, directionImage)
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
        
        // Do any additional setup after loading the view.
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
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return directionImage
    }


}
