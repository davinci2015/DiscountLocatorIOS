//
//  ViewController.swift
//  Discount Locator
//
//  Created by Faculty of Organisation and Informatics on 10/11/15.
//  Copyright © 2015 air. All rights reserved.
//

import UIKit
import db
import ws
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var ovojeJASON = HTTPRequest.sharedWSInstance.httprequest("http://cortex.foi.hr/mtl/courses/air/", serviceName: "discounts", params: ["method":"getAll"])
        
        print(ovojeJASON)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

