//
//  HomeModel2.swift
//  orbitalSample
//
//  Created by Anusree on 24/6/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import Foundation

protocol HomeModel2Protocal: class {
    func itemsDownloaded(items: NSArray)
}


class HomeModel2: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModel2Protocal!
    
    var data : NSMutableData = NSMutableData()
    
    let urlPath: String = "http://localhost:8080/carpark.php" //this will be changed to the path where service.php lives
    
    func downloadItems() {
        
        let url: NSURL = NSURL(string: urlPath)!
        var session: URLSession!
        let configuration = URLSessionConfiguration.default
        
        
        session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        let task = session.dataTask(with: url as URL)
        
        task.resume()
        
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        self.data.append(data);
        
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
        
        var jsonResult = NSArray()
        
        do {
            jsonResult = try JSONSerialization.jsonObject(with: self.data as Data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let carparks: NSMutableArray = NSMutableArray()
        
        
        for num in 0..<jsonResult.count{
            
            jsonElement = jsonResult[num] as! NSDictionary
            
            let carpark = CarparkModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            let zone1 = jsonElement["zone"] as? String
            let diagram = jsonElement["diagram"] as? String

            
            
            carpark.zone1 = zone1
            carpark.diagram = diagram

            
            
            carparks.add(carpark)
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: carparks)
            
        })
    }
}
