//
//  DellinCarrierModel.swift
//  YOUTIR
//
//  Created by Tom Malary on 1/23/16.
//  Copyright © 2016 YOUTIR LLC. All rights reserved.
//

import Foundation
import Alamofire

class Dellin: QuoteProvider {
    let name = "Dellin"
    let logoImagePath = "carrierName2.png"
    let telephone = "+14069283744"
    let web = "www.dellin.ru"
    let urlString = "https://api.dellin.ru/v1/public/calculator.json"
    let username = "malbaq"
    let apiKey = "E4F3F36C-F8A1-11E4-8F8A-00505683A6D3"
    
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
    
    func getQuoteFor(request: RequestX) -> QuoteX? {
        
        var quote : QuoteX?
        
        Alamofire.request(.POST, urlString, parameters: parameters, encoding: .JSON, headers: headers)
            .responseJSON { response in
                print("Original URL request \(response.request!)")  // original URL request
                print("URL response \(response.response!)") // URL response
                print("Server data \(response.data!)")     // server data
                print("Result of response serialization \(response.result)")   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    
                }
        }
        
        return quote
    }
}





//1. Создаем QuoteManager() при загрузке viewController'a
//1.a. Создаем Pecom() с инициализированными parametres
//2. В Manager'e сразу после ввода обоих названий городов, вызываем Pecom.getCityID(title:String) -> Bool.
//3. getCity func добавит ["senderCityId"] и ["receiverCityId"] в Pecom.parametres и вернет true
//4. Если true, то append массив Провайдеров Манагера
//5. Передаем этому массиву Request и делаем fetch с известными ID  City