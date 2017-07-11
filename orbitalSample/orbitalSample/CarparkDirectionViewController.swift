//
//  CarparkDirectionViewController.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 6/24/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit
import Foundation

class CarparkDirectionViewController: UIViewController {

    var selectedStore : StoreModel?
    
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var directionImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeLabel.text = "Directions to " + (self.selectedStore?.name)!
        
        let str = (self.selectedStore?.name)!
        
        print(str)
        
        let trimmedString = str.replacingOccurrences(of: " ", with: "")
        
        print(trimmedString)

        let urlImage = "http://192.168.0.19:8080/carpark_directions/c1_" + trimmedString + ".png"
        get_image(urlImage, directionImage)


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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
