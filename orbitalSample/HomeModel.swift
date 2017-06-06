//
//  HomeModel.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 6/4/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import Foundation

protocol HomeModelProtocal: class {
    func itemsDownloaded(items: NSArray)
}


class HomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModelProtocal!
    
    var data : NSMutableData = NSMutableData()
    
    let urlPath: String = "file:///Users/anusree/Desktop/Orbital/orbitalSample/orbitalSample/listAllStores2.php" //this will be changed to the path where service.php lives

    func downloadItems() {
        
        let url: NSURL = NSURL(string: urlPath)!
        var session: URLSession!
        _ = URLSessionConfiguration.default
        
        
        session = URLSession()
        
        let task = session.dataTask(with: url as URL)
        
        task.resume()
        
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        self.data.append(data as Data);
        
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if error != nil {
            print("Failed to download data")
        }else {
            print("Data downloaded")
            self.parseJSON()
        }
        
    }
    
    func parseJSON() {
        
        var jsonResult: NSMutableArray = NSMutableArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: self.data as Data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSMutableArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let stores: NSMutableArray = NSMutableArray()
        
        
        for num in 0..<jsonResult.count{

            
            jsonElement = jsonResult[num] as! NSDictionary
            
            let store = StoreModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let name = jsonElement["Name"] as? String,
                let unit = jsonElement["Unit"] as? String,
                let opening = jsonElement["Opening Hours"] as? String,
                let website = jsonElement["Website"] as? String,
                let number = jsonElement["Number"] as? String,
                let descrp = jsonElement["Description"] as? String,
                let diagram = jsonElement["Diagram"] as? String
            {
                
                store.name = name
                store.unit = unit
                store.opening = opening
                store.website = website
                store.number = number
                store.descrp = descrp
                store.diagram = diagram
                
            }
            stores.add(store)
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: stores)
            
        })
    }
}
