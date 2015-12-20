//
//  SettingsTableViewController.swift
//  Discount Locator
//
//  Created by Faculty of Organisation and Informatics on 20/12/15.
//  Copyright © 2015 air. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    let prefs = NSUserDefaults.standardUserDefaults()
 
    @IBOutlet var useBackSwipeSwitch: UISwitch!
    @IBOutlet var useAnimationsSwitch: UISwitch!
    
    @IBAction func OnUseAnimationsChanged(sender: UISwitch) {
        prefs.setBool(sender.on, forKey: "UseAnimations")
        Settings.changeAnimationSetting(sender.on)
    }

    @IBAction func OnBackSwipeChanged(sender: UISwitch) {
         prefs.setBool(sender.on, forKey: "UseBackSwipe")
         Settings.changeBackSwipeSetting(sender.on)
    }
    
    func loadFromUserPrefs(){
        useAnimationsSwitch.setOn(prefs.boolForKey("UseAnimations"),animated:false)
        useBackSwipeSwitch.setOn(prefs.boolForKey("UseBackSwipe"), animated:false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFromUserPrefs()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

  

}
