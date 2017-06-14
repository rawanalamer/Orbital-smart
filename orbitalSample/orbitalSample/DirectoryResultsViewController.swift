//
//  DirectoryResultsViewController.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 5/31/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class DirectoryResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var resultLabel: UILabel!
    var feedItems: NSArray = NSArray()
    var selectedStore : StoreModel = StoreModel()
    @IBOutlet weak var listTableView: UITableView!
    var data : NSMutableData = NSMutableData()
    var search :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = "Results"
        //set delegates and initialize homeModel
        if(feedItems.count == 0){
            resultLabel.text = "Store does not exist"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell {
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }
}
