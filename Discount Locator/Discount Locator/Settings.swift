//
//  Settings.swift
//  Discount Locator
//
//  Created by Faculty of Organisation and Informatics on 20/12/15.
//  Copyright © 2015 air. All rights reserved.
//

import Foundation

class Settings {
    let prefs = NSUserDefaults.standardUserDefaults()
    static func changeAnimationSetting(newState:Bool){
         UIView.setAnimationsEnabled(newState)
    }
    static func changeBackSwipeSetting(newState:Bool){
        let swipeGestureRecognizer=UISwipeGestureRecognizer()
        swipeGestureRecognizer.enabled=newState
    }
}