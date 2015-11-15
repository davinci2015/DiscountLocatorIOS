//
//  ViewController.swift
//  Discount Locator
//
//  Created by Faculty of Organisation and Informatics on 10/11/15.
//  Copyright © 2015 air. All rights reserved.
//

import UIKit
import db
class ViewController: UITableViewController {
    
    @IBOutlet weak var storesTableView: UITableView!
    
    var webServiceDataLoader = WebServiceDataLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webServiceDataLoader.storesTableView = self.storesTableView
        webServiceDataLoader.LoadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return webServiceDataLoader.stores.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        var store: Store
        
        store = webServiceDataLoader.stores[indexPath.row]
        
        cell.textLabel!.text = store.name
        cell.detailTextLabel!.text = store.desc
        
        return cell
    }

}

