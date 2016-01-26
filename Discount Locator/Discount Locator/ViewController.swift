import UIKit
import db
import core
import Kingfisher
import RealmSwift

public class ViewController: UITableViewController {
    
    @IBOutlet weak var storesTableView: UITableView!
    
    var webServiceDataLoader = WebServiceDataLoader()
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        //set User Defaults
        UserDefaults.checkIfUserDefaultsAreSet()
        
        //set default Realm DB configuration
//        DbController.sharedDBInstance.setDbSchema()
        Realm.Configuration.defaultConfiguration = Realm.Configuration(
            schemaVersion: 3,
            migrationBlock: { migration, oldSchemaVersion in })
        
        webServiceDataLoader.storesTableView = self.storesTableView
        webServiceDataLoader.LoadData()
        //turn off animation because it's initial view controller
        self.animationCheck()
        
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webServiceDataLoader.stores.count
    }
    
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! StoreTableViewCell
        var store: Store
        store = webServiceDataLoader.stores[indexPath.row]
        cell.storeTitle.text = store.name
        cell.storeDescription.text = store.desc
        cell.storeImageView.kf_setImageWithURL(NSURL(string:store.imgUrl)!)
        
        return cell
    }
    
    public override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDiscountsSegue" {
            if let destination = segue.destinationViewController as? DiscountsViewController {
                if let storeIndex = tableView.indexPathForSelectedRow {
                    destination.discounts = webServiceDataLoader.stores[storeIndex.row].discounts
                }
            }
        }
    }

}

