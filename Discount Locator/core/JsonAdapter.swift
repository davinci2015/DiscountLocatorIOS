//
//  JsonAdapter.swift
//  Discount Locator
//
//  Created by Faculty of Organisation and Informatics on 13/11/15.
//  Copyright © 2015 air. All rights reserved.
//

import Foundation

import SwiftyJSON
import db

public class JsonAdapter
{
    public static func getStores(json: AnyObject) -> Array<Store>
    {
        var stores = [Store]()
        let jsonStores = JSON(json)
        
        let items = jsonStores["items"]
        
        
        for (key, subJson) in items {
            var s:Store = Store()
            s.remoteId = subJson["id"].int!
            s.name = subJson["name"].string!
            s.desc = subJson["description"].string!
            s.imgUrl = subJson["imgUrl"].string!
            s.latitude = subJson["latitude"].float!
            s.longitude = subJson["longitude"].float!
            
            stores.append(s)
        }
        
        return stores
    }
    
    public static func getDiscounts(json: AnyObject) -> Array<Discount>
    {
        var discounts = [Discount]()
        let jsonStores = JSON(json)
        
        let items = jsonStores["items"]
        
        
        for (key, subJson) in items {
            var d:Discount = Discount()
            d.remoteId = subJson["id"].int!
            d.name = subJson["name"].string!
            d.desc = subJson["description"].string!
            d.discount = subJson["discount"].int!
            d.endDate = subJson["endDate"].string!
            d.startDate = subJson["startDate"].string!
            d.storeId = subJson["storeId"].int!
            
            discounts.append(d)
        }
        
        return discounts
    }

}