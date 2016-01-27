//
//  PecomCarrierModel.swift
//  YOUTIR
//
//  Created by Tom Malary on 1/18/16.
//  Copyright © 2016 YOUTIR LLC. All rights reserved.
//

import Foundation
import Alamofire

class Pecom: QuoteProvider {
    var name = "Pecom"
    var logoImagePath = "carrierName1.png"
    var telephone = "+14069283744"
    var web = "www.pecom.ru"
    
    let username = "malbaq"
    let password = "8F102968198C7999F7AF8840FE7B44D2F4BBAD81"
    // Определяем запрос по умолчанию, а при передаче (getQuoteFor) переписываем соответствующие значения на актуальные данные Request'a
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
    
    func getCityIDFor(cityName: String, isSenderCity: Bool) -> Bool {
        
        let credentialData = "\(username):\(password)".dataUsingEncoding(NSUTF8StringEncoding)!
        let base64Credentials = credentialData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.init(rawValue: 0))
        let headers = [ "Accept": "application/json",
            "Content-Type": "application/json;charset=utf-8",
            "Authorization": "Basic \(base64Credentials)",
            "Accept-Encoding": "gzip" ]
        
        let params = ["title": cityName]
        
        Alamofire.request(.POST, "https://kabinet.pecom.ru/api/v1/branches/findbytitle/", parameters: params, encoding: .JSON, headers: headers)
            .responseJSON { response in
                print("Original URL request \(response.request!)")  // original URL request
                print("URL response \(response.response!)") // URL response
                print("Server data \(response.data!)")     // server data
                print("Result of response serialization \(response.result)")   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    
                }
                // here to add cityIds to var parametres
                // and return true
                // else to add nothing
                // and return false
        }
        return true
    }
    
    func getQuoteFor(request: RequestX) -> QuoteX? {
        
        let credentialData = "\(username):\(password)".dataUsingEncoding(NSUTF8StringEncoding)!
        let base64Credentials = credentialData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.init(rawValue: 0))
        
        let headers = [
            "Accept": "application/json",
            "Content-Type": "application/json;charset=utf-8",
            "Authorization": "Basic \(base64Credentials)",
            "Accept-Encoding": "gzip"
        ]
        
        var quote : QuoteX?
        
        Alamofire.request(.POST, "https://kabinet.pecom.ru/api/v1/CALCULATOR/CALCULATEPRICE/", parameters: parameters, encoding: .JSON, headers: headers)
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