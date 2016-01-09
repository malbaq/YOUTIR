//
//  PecomRequest.swift
//  YOUTIR
//
//  Created by Tom Malary on 1/7/16.
//  Copyright © 2016 YOUTIR LLC. All rights reserved.
//

import Foundation

class PecomRequest {
    
    let username = "malbaq"
    let password = "8F102968198C7999F7AF8840FE7B44D2F4BBAD81"
    let urlString = "https://kabinet.pecom.ru/api/v1/BRANCHES/FINDBYTITLE/"

    func getPecomQuote() {
        let json = [
            "title": "Степное"
        ]
        
        let jsonData = try! NSJSONSerialization.dataWithJSONObject(json, options: [])
        
        // Config Basic Auth
        let loginString = NSString(format: "%@:%@", username, password)
        let loginData: NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64LoginString = loginData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.init(rawValue: 0))
        
        // Create, config and perfom HTTP Request
        let url = NSURL(string: urlString)
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        request.addValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.HTTPBody = jsonData
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            if let response = response {
                print("the response is \(response)")
            }
        }
        
        task.resume()
    }
}