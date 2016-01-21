//
//  CoreUnitTests.swift
//  Discount Locator
//
//  Created by Faculty of Organisation and Informatics on 21/01/16.
//  Copyright © 2016 air. All rights reserved.
//

import XCTest
import core
import db
import SwiftyJSON

class CoreUnitTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func testParsing(){
        let a = JSON("{items:ducan}")
        print(a["items"])
        
        let stores = JsonAdapter.getStores("{items = \"[{\"id\":\"1\",\"name\":\"Super Nova\",\"description\":\"Veliko blagdansko sni\\u017eenje u odabranim du\\u0107anima u centru Super Nova.\",\"imgUrl\":\"http:\\/\\/cortex.foi.hr\\/mtl\\/courses\\/air\\/img\\/slika1.png\",\"longitude\":\"16307138\",\"latitude\":\"46319970\"},{\"id\":\"2\",\"name\":\"Varteks\",\"description\":\"Popust na sve kolekcije ljetne odje\\u0107e u Varteks Outlet du\\u0107anu.\",\"imgUrl\":\"http:\\/\\/cortex.foi.hr\\/mtl\\/courses\\/air\\/img\\/slika2.png\",\"longitude\":\"16343460\",\"latitude\":\"46292420\"}]\"}")
       print("broj 'canadu':",stores.count)
        XCTAssertTrue(stores.count==2, "nije vratio 2 dućana")
        
        
    }
}
