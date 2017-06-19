//
//  DirectoryResultsViewController.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 5/31/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class DirectoryResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    @IBOutlet weak var mysearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var results = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return results.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        var myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        return myCell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        if(searchBar.text?.isEmpty)!{
            return
        }
        doSearch(searchWord: searchBar.text!)
    }
    
    func doSearch(searchWord: String){
        mysearchBar.resignFirstResponder()
        
        let myURL = NSURL(string: "http://localhost:8080/searchStore.php")
        
        var request = URLRequest(url:myURL! as URL)
        request.httpMethod = "POST"
        
        let postString = "name=\(searchWord)"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler:{ (data: Data?, response: URLResponse!, error: Error!) -> Void in
            
            if error != nil{
                return
            }
            
            var err: Error?
            //STOPPED HERE AS OF NOW
            var json = JSONSerialization.jsonObject(with: data, options: .mutableContainers, error: &err)
        })
        
        task.resume()
    }


}
