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
    public var stores: [Store] = []
    public var discounts: [Discount] = []
    public var storesTableView: UITableView?
    
    internal var tabViewTabBar: TabBarController?
    
    public func LoadData() {


        HTTPRequest.sharedWSInstance.httprequest("https://obscure-lake-7668.herokuapp.com/stores")
            {
                (result: AnyObject) in
                let result = JsonAdapter.getStores(result)
                self.stores = result.stores
                self.discounts = result.discounts
                self.showLoadedData()
        }

    }
    
    private func showLoadedData()
    {
        self.bindData()
        storesTableView?.reloadData()
        
        tabViewTabBar?.tabBar.items![1].enabled=true
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
    }
}