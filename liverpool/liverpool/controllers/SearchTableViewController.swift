//
//  SearchTableViewController.swift
//  liverpool
//
//  Created by Erick Cienfuegos on 12/20/17.
//  Copyright © 2017 Erick Cienfuegos. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import AlamofireObjectMapper
import SwiftyJSON

class SearchTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet var topSearchBar: UISearchBar!
    var records: [Record]! = []
    
    let searchURL = "https://www.liverpool.com.mx/tienda/?s=[criterio]&d3106047a194921c01969dfdec083925=json"
    let criterioKey = "[criterio]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "Search"

        //topSearchBar.showsSearchResultsButton = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return records.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? TableViewCell

        //
        
        let url = URL(string: (records[indexPath.row].attributes?.skuSmallImage)!)!

        cell?.imageview.af_setImage(withURL: url)
        cell?.titleLabel.text = (records[indexPath.row].attributes?.productDisplayName)!
        cell?.priceLable?.text = (records[indexPath.row].attributes?.skuListPrice)!

        return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        print("keywords \(searchBar.text!)")
        
        let keywords = searchBar.text?.trim()
        
        //Save on SQLlite keywords
        if let id = SearchDB.instance.addSearch(keywords!) {
            print("SearchDB \(keywords!) add with ID: \(id)" )
        }
        
        print("clean keywords \(keywords!.clearForUrl())")
        //keywords.clearUrl
        let url = searchURL.replacingOccurrences(of: criterioKey, with: keywords!.clearForUrl())
        
        
        Alamofire.request(url).responseJSON { response in
            //print("Request: \(String(describing: response.request))")   // original url request
            //print("Response: \(String(describing: response.response))") // http url response
            //print("Result: \(response.result)")                         // response serialization result
            
            //$.contents[0].mainContent[1].contents[0].records
            
            if let value = response.result.value {
                //print("JSON: \(json)") // serialized json response
                let json = JSON(value)
                
                let recordsJSON  = json["contents"][0]["mainContent"][1]["contents"][0]["records"].array//json["contents"][0]["mainContent"][0]["totalNumRecs"].string //["contents"][0]["records"]
                debugPrint("records: \(recordsJSON?.count ?? 0)")
 
                if (recordsJSON?.count ?? 0) > 0 {
                    for recordJSON in recordsJSON! {
                        self.records?.append(Record(json: recordJSON)!)
                        //print("Hello, \(name)!")
                    }
                    
                    debugPrint("Records COUNT: \(self.records.count)")
                    
                    self.tableView.reloadData()
                } else {
                    print("Sin resultados")
                }
                
                
            }
            
            
        }
        
    }
}

