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
        // Get the location to be shown
        let item: StoreModel = feedItems[indexPath.row] as! StoreModel
        // Get references to labels of cell
        myCell.textLabel!.text = item.name
        print(myCell)
        return myCell
    }
    

    
}
