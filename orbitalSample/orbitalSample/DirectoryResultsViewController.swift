//
//  DirectoryResultsViewController.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 5/31/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class DirectoryResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocal{
    @IBOutlet weak var resultLabel: UILabel!
    var feedItems: NSArray = NSArray()
    var selectedStore : StoreModel = StoreModel()
    @IBOutlet weak var listTableView: UITableView!
    var data : NSMutableData = NSMutableData()
    var search :String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        
        resultLabel.text = search
        
        let myUrl : NSURL = NSURL(string:"http://localhost:8080/searchStore.php")!
        
        var json = ""

        let request: NSMutableURLRequest = NSMutableURLRequest(url:(myUrl as NSURL) as URL);
        
        let postString = "name=\(search)";
        
        request.httpMethod = "POST";
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main){
            response, data, error in
            
            if data != nil {
                json = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as! String
            }
            print(json)
        }
        
        self.parseJSON()
        
        
    }
    
    
    
    func parseJSON() {
        
        var jsonResult = NSArray()
        
        do {
            jsonResult = try JSONSerialization.jsonObject(with: self.data as Data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let stores: NSMutableArray = NSMutableArray()
        
        
        for num in 0..<jsonResult.count{
            
            jsonElement = jsonResult[num] as! NSDictionary
            
            let store = StoreModel()
            
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
            
            self.itemsDownloaded(items: stores)
        }
    }
    

    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the store to be shown
        let item: StoreModel = feedItems[indexPath.row] as! StoreModel
        
        // Get references to labels of cell
        myCell.textLabel!.text = item.name
        //print(myCell)
        return myCell
    }

}
