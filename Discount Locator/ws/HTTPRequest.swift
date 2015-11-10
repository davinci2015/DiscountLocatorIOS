//
//  HTTPRequest.swift
//  Discount Locator
//
//  Created by Faculty of Organisation and Informatics on 10/11/15.
//  Copyright © 2015 air. All rights reserved.
//
import Alamofire
public class HTTPRequest
{
    public static var sharedWSInstance = HTTPRequest()
    
    public func httprequest(url: String, serviceName: String, params: [String : String])
    {
        let serviceUrl: String = serviceName + ".php"
        Alamofire.request(.POST, "http://cortex.foi.hr/mtl/courses/air/\(serviceUrl)", parameters: params)
            .responseJSON { response in
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    //TODO: VRAĆANJE SA COMPLETITION HANDLER PATTERNOM http://stackoverflow.com/questions/27390656/how-to-return-value-from-alamofire
                }
        }
    }
}