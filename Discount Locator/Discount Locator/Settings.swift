//
//  Settings.swift
//  Discount Locator
//
//  Created by Faculty of Organisation and Informatics on 20/12/15.
//  Copyright © 2015 air. All rights reserved.
//

import Foundation
import UIKit


class Settings {
    let prefs = NSUserDefaults.standardUserDefaults()
    static func changeAnimationSetting(newState:Bool){
         UIView.setAnimationsEnabled(newState)
    }
}
extension UIViewController { //koristenjem extenzija se prosiruju funkcionalnosti postojecih klasa
    func backSwipeCheck(){ //svaki UIViewcontroller ce sada imati funkcionalnost za provjeru jel se smije backswipeati il ne
        if(NSUserDefaults.standardUserDefaults().boolForKey("UseBackSwipe")){
               self.navigationController!.interactivePopGestureRecognizer!.enabled = true
        }
        else {
              self.navigationController!.interactivePopGestureRecognizer!.enabled = false
        }
    }
}