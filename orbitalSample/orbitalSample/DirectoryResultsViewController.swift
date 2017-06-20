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
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        myCell.textLabel?.text = results[indexPath.row]
        
        return myCell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        if(searchBar.text!.isEmpty)
        {
            return
        }
        
        //mysearchBar.resignFirstResponder()
        doSearch(searchWord: searchBar.text!)
        
    }
    func doSearch(searchWord: String){
        
        
        let myURL = NSURL(string: "http://localhost:8080/searchStore.php")
        
        var request = URLRequest(url:myURL! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let postString = "name=\(searchWord)"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler:{ (data: Data?, response: URLResponse!, error: Error!) -> Void in
            
            DispatchQueue.main.async() {
                
                if error != nil{
                    self.displayAlertMessage(userMessage: error.localizedDescription)
                    return
                }
                do{
                    var _: Error?
                    //STOPPED HERE AS OF NOW
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary

                    
                    self.results.removeAll(keepingCapacity: false)
                    self.tableView.reloadData()
                    
                    print("1")
                    if let parseJSON = json{
                        
                        print("2")
                        if let stores = parseJSON["stores"] as? [AnyObject]{
                            print("3")
                            for storeOjb in stores{
                                let name = (storeOjb["name"] as! String)
                                self.results.append(name)
                                print(name)
                            }
                            
                            self.tableView.reloadData()
                            
                        }else if(parseJSON["message"] != nil){
                            print("4")
                            let errorMessage = parseJSON["message"] as? String
                            if(errorMessage != nil){
                                self.displayAlertMessage(userMessage: errorMessage!)
                                
                            }
                        }
                    }
                } catch {
                    print(error)
                }
            }
            
        })
        
        task.resume()
    }
    
    func displayAlertMessage(userMessage: String)
    {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let okAction =  UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
}
