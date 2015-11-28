import UIKit
import db

class ViewController: UITableViewController {
    
    @IBOutlet weak var storesTableView: UITableView!
    
    var webServiceDataLoader = WebServiceDataLoader()
    
    let blogSegueIdentifier = "ShowDiscountsSegue"
    
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
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == blogSegueIdentifier {
            if let destination = segue.destinationViewController as? DiscountsViewController {
                if let storeIndex = tableView.indexPathForSelectedRow {
                    /*
                        TO DO:
                    
                    *   OVO OVAKO NE MOZE!!!
                        NEMA BOGA SA OVO OVAKO MOZE!!!!!!!!
                    */
                    var i = 0
                    
                    for store in webServiceDataLoader.stores{
                        if(i == storeIndex.row)
                        {
                            destination.discounts = store.discounts
                        }
                        i++
                    }
                    
                    
                }
            }
        }
    }

}

