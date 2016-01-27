//
//  TestFeaturesViewController.swift
//  YOUTIR
//
//  Created by Tom Malary on 1/17/16.
//  Copyright © 2016 YOUTIR LLC. All rights reserved.
//

import UIKit
import Alamofire

class TestFeaturesViewController: UIViewController {
    
    
    @IBAction func testDellin(sender: AnyObject) {
        let username = "malbaq"
        let password = "E4F3F36C-F8A1-11E4-8F8A-00505683A6D3"
        
        let parameters = [
            "appKey":"E4F3F36C-F8A1-11E4-8F8A-00505683A6D3",
            "derivalPoint":     "7800000000000000000000000",
            "derivalDoor":      true,
            "arrivalPoint":     "5200000100000000000000000",
            "arrivalDoor":      false,
            "sizedVolume":      "1",
            "sizedWeight":      "1",
            "oversizedVolume":  "1",
            "oversizedWeight":  "1",
            "length": "1",
            "width": "1",
            "height": "1",
            "statedValue": 1000,
            "packages":[
                "0xAD22189D098FB9B84EEC0043196370D6"
            ],
            "derivalServices":["0xb83b7589658a3851440a853325d1bf69"],
            "arrivalServices":["0xb83b7589658a3851440a853325d1bf69"],
            "quantity": 2
        ]
        
        let headers = [
            "Content-Type": "application/json"
        ]
        
        Alamofire.request(.POST, "https://api.dellin.ru/v1/public/calculator.json", parameters: parameters, encoding: .JSON, headers: headers)
            .responseJSON { response in
                print("Original URL request \(response.request!)")  // original URL request
                print("URL response \(response.response!)") // URL response
                print("Server data \(response.data!)")     // server data
                print("Result of response serialization \(response.result)")   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let username = "malbaq"
        let password = "8F102968198C7999F7AF8840FE7B44D2F4BBAD81"
        
        let credentialData = "\(username):\(password)".dataUsingEncoding(NSUTF8StringEncoding)!
        let base64Credentials = credentialData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.init(rawValue: 0))
        
        let parameters = [
                "senderCityId": 446,
                "receiverCityId": 463,
                "isOpenCarSender": false,
                "senderDistanceType": 0,
                "isDayByDay": false,
                "isOpenCarReceiver": false,
                "receiverDistanceType": 0,
                
                "isHyperMarket": false,
                "calcDate": "2014-01-21",
                "isInsurance": true,
                "isInsurancePrice": 234.15,
                "isPickUp": false,
                "isDelivery": false,
                "Cargos": [[
                "length": 2.1,
                "width": 3.2,
                "height": 2.3,
                "volume": 4.4,
                "maxSize": 3.2,
                "isHP": false,
                "sealingPositionsCount": 0,
                "weight": 10,
                "overSize": false
                ]]
        ]
        
        let headers = [
            "Accept": "application/json",
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": "Basic \(base64Credentials)",
            "Accept-Encoding": "gzip"
        ]
        
        Alamofire.request(.POST, "https://kabinet.pecom.ru/api/v1/CALCULATOR/CALCULATEPRICE/", parameters: parameters, encoding: .JSON, headers: headers)
            .responseJSON { response in
                print("Original URL request \(response.request!)") // original URL request
                print("URL response \(response.response!)") // URL response
                print("Server data \(response.data!)") // server data
                print("Result of response serialization \(response.result)") // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
