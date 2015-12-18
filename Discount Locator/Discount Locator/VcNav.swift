//
//  VcNav.swift
//  Discount Locator
//
//  Created by Faculty of Organisation and Informatics on 18/12/15.
//  Copyright © 2015 air. All rights reserved.
//

import Foundation

class VcNav:UIViewController{
    
    
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var Open: UIBarButtonItem!
    
    func showView(content:UIViewController){
         // TODO PRIKAZATI MAPE/STOREOVE UNUTAR KONTEJNERAScontainerView.
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Open.target=self.revealViewController()
        Open.action = Selector("revealToggle:")
        
        //showView("stores")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}