//
//  ViewController.swift
//  Discount Locator
//
//  Created by Faculty of Organisation and Informatics on 10/11/15.
//  Copyright © 2015 air. All rights reserved.
//

import UIKit
import db
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var k:WebServiceDataLoader = WebServiceDataLoader()
        k.LoadData()
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

