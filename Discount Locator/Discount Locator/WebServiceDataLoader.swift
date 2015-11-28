//
//  WebServiceDataLoader.swift
//  Discount Locator
//
//  Created by Faculty of Organisation and Informatics on 13/11/15.
//  Copyright © 2015 air. All rights reserved.
//

import Foundation
import db
import core
import ws
public class WebServiceDataLoader:DataLoader
{
    private var discountsLoaded: Bool = false
    private var storesLoaded: Bool = false
    public var stores: [Store] = []
    public var discounts: [Discount] = []
    
    public var storesTableView: UITableView?
    
    public func LoadData() {
        HTTPRequest.sharedWSInstance.httprequest("http://www.json-generator.com/api/json/get/csbvEnjqnC")
            {
                (result: AnyObject) in
                self.stores = JsonAdapter.getStores(result)
                self.storesLoaded = true
                self.showLoadedData()
        }
        HTTPRequest.sharedWSInstance.httprequest("http://www.json-generator.com/api/json/get/ccWtDCAmRe")
            {
                (result: AnyObject) in
                self.discounts = JsonAdapter.getDiscounts(result)
                self.discountsLoaded = true
                self.showLoadedData()
        }
    }
    
    private func showLoadedData()
    {
        if(storesLoaded && discountsLoaded)
        {
            self.bindData()
    
            storesTableView?.reloadData()
        }
    }

    private func bindData()
    {
        DbController.sharedDBInstance.realm.beginWrite()
        DbController.sharedDBInstance.realm.deleteAll()
        try! DbController.sharedDBInstance.realm.commitWrite()
        
        for store in stores
        {
            DbController.sharedDBInstance.realmAdd(store)
            for discount in discounts
            {
                if(discount.storeId == store.remoteId)
                {
                    discount.storeSet(store)
                    DbController.sharedDBInstance.realmAdd(discount)
                }
            }
        }
        
//        print(DbController.sharedDBInstance.realm.objects(Store))
//        print(DbController.sharedDBInstance.realm.objects(Discount))
    }
}