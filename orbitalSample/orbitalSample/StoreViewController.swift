//
//  StoreViewController.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 6/4/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocal  {
    
    //Properties
    
    @IBOutlet weak var name: UILabel!
    var feedItems: NSArray = NSArray()
    var selectedStore : StoreModel = StoreModel()
    @IBOutlet weak var listTableView: UITableView!
    var tapped: ((StoreModel) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self

        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        
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

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Set selected location to var
        selectedStore = feedItems[indexPath.row] as! StoreModel
        // Manually call segue to detail view controller
        self.performSegue(withIdentifier: "detailSegue", sender: self)
        print("performSegue works")
    }
    
    /*func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        print("prepareForSegue works")
        // Get reference to the destination view controller
        let detailVC  = segue!.destination as! StoreDetailsController
        // Set the property to the selected location so when the view for
        // detail view controller loads, it can access that property to get the feeditem obj
        detailVC.selectedStore = selectedStore
        
    }*/
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("prepareForSegue works")
        if segue.identifier == "detailSegue", let destination = segue.destination as? StoreDetailsController {
            if let cell = sender as? UITableViewCell, let indexPath = listTableView.indexPath(for: cell)  {
                let selectedStore = feedItems[indexPath.row] as! StoreModel
                destination.selectedStore = selectedStore
            }
        }
    }
    

    
}
