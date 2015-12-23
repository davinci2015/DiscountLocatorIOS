//
//  SearchDiscountsTabeViewController.swift
//  Discount Locator
//
//  Created by Faculty of Organisation and Informatics on 21/12/15.
//  Copyright © 2015 air. All rights reserved.
//

import UIKit
import db

class SearchDiscountsTabeViewController: UITableViewController, UISearchResultsUpdating{
    var discounts: [Discount] = []
    var resultSearchController = UISearchController ()
    var filteredDiscounts = [Discount]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //self.backSwipeCheck()
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater=self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        definesPresentationContext=true //ako odeš na neki drugi ViewController search bar nece ostati tu
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //helper funkcija kod filtriranja discountova
    func filterContentForSearchText(searchText: String, scope: String = "All") { //pretrazivanje po imenu discounta
        //filter() takes a closure of type (discount: Discount) -> Bool. It then loops over all the elements of the array, and calls the closure, passing in the current element, for every one of the elements.
        filteredDiscounts = discounts.filter { discount in
            return discount.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        tableView.reloadData()
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.resultSearchController.active && resultSearchController.searchBar.text != "" {
            return self.filteredDiscounts.count
        }
        return self.discounts.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("DiscountCell", forIndexPath: indexPath) as UITableViewCell
        let discount: Discount
        if(self.resultSearchController.active && resultSearchController.searchBar.text != "") {
            discount = filteredDiscounts[indexPath.row]
        }
        else {
            discount = discounts[indexPath.row]
        }
        cell.textLabel!.text = discount.name
        cell.detailTextLabel!.text = discount.desc
        return cell
    }
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let title = "📈 " + discounts[indexPath.row].name + " : " + String(discounts[indexPath.row].discount) + "%"
        
        var message = discounts[indexPath.row].desc + "\n\n"
        message += "📅 " + discounts[indexPath.row].startDate + "\n"
        message +=  "📅 " + discounts[indexPath.row].endDate + "\n"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
        
        print(indexPath.row)
    }

}
