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
    var data : NSMutableData = NSMutableData()
    let stores: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchButtonTouch(_ sender: Any) {
        let storeName = textField.text
        let myUrl = URL(string:"http://localhost:8080/searchStore.php")
        var request = URLRequest(url: myUrl!)
        request.httpMethod = "POST"
        let postString = "name="+storeName!
        print(postString)
        request.httpBody = postString.data(using: .utf8)
        print("1")
        let session = URLSession.shared
        print("2")
        let task = session.dataTask(with: request){
            data, response, error in
            
            if error != nil{
                print("error=\(String(describing: error))")
                return
            }
            
        }
        task.resume()
        let secondViewController = storyboard?.instantiateViewController(withIdentifier: "DirectoryResultsViewController") as! DirectoryResultsViewController
        secondViewController.feedItems = stores
        // Take user to SecondViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        print("3")
    }
    

    
    @IBAction func storesButtonTouch(_ sender: Any) {
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        self.data.append(data);
        print("4")
        
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("4")
        if error != nil {
            print("Failed to download data")
        }else {
            print("Data downloaded")
            self.parseJSON()
        }
        
    }
    
    func parseJSON(){
        var jsonResult = NSArray()
        
        do {
            jsonResult = try JSONSerialization.jsonObject(with: self.data as Data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        
        
        for num in 0..<jsonResult.count{
            
            jsonElement = jsonResult[num] as! NSDictionary
            
            let store = StoreModel()
            
            let message = jsonElement["message"] as? String
            
            if (message == "Success"){
                
                //the following insures none of the JsonElement values are nil through optional binding
                let name = jsonElement["name"] as? String
                let unit = jsonElement["unit"] as? String
                let opening = jsonElement["opening"] as? String
                let website = jsonElement["website"] as? String
                let number = jsonElement["number"] as? String
                let descrp = jsonElement["description"] as? String
                let diagram = jsonElement["diagram"] as? String
                
                
                store.name = name
                store.unit = unit
                store.opening = opening
                store.website = website
                store.number = number
                store.descrp = descrp
                store.diagram = diagram
                
                
                stores.add(store)
            }
        }
        
    }
    

}

