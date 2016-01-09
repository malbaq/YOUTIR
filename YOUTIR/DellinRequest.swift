//
//  DellinRequest.swift
//  YOUTIR
//
//  Created by Tom Malary on 1/7/16.
//  Copyright © 2016 YOUTIR LLC. All rights reserved.
//

import Foundation

class DellinRequest {
    let username = ""
    let password = "E4F3F36C-F8A1-11E4-8F8A-00505683A6D3"
    let urlString = "https://api.dellin.ru/v1/public/calculator.json"
    
    func getDellinQuote() {
        let json = [
            "appKey":"E4F3F36C-F8A1-11E4-8F8A-00505683A6D3",// ключ для вашего приложения
            "derivalPoint":     "7800000000000000000000000", // код КЛАДР пункта отправки  (обязательное поле)
            "derivalDoor":      true, // необходима доставка груза от адреса     (необязательный параметр), true/false
            "arrivalPoint":     "5200000100000000000000000", // код КЛАДР пункта прибытия (обязательный параметр)
            "arrivalDoor":      false, // необходима доставка груза до адреса    (необязательный параметр), true/false
            "sizedVolume":      "1", // общий объём груза в кубических метрах (обязательный параметр)
            "sizedWeight":      "1", // общий вес груза в килограммах (обязательный параметр)
            "oversizedVolume":  "1", // объём негабаритной части груза в метрах кубических (необязательный параметр)
            "oversizedWeight":  "1", // вес негабаритной части груза в килограммах (необязательный параметр)
            "length": "1", // длинна самого длинного из мест (необязательный параметр)
            "width": "1",  // ширина самого широкого из мест (необязательный параметр)
            "height": "1", // высота самого высокого из мест (необязательный параметр)
            "statedValue": 1000, // заявленная стоимость груза в рублях. При отсутсвии - груз не страхуется, при передаче 0 - страхуется без объявленной стоимости, при передаче значения больше 0 - страхуется на указанную сумму (необязательный параметр)
            "packages":[
            "0xAD22189D098FB9B84EEC0043196370D6"
            ], // необходимо упаковать груз в упаковку (необязательные параметры)
            "derivalServices":["0xb83b7589658a3851440a853325d1bf69"],// требуются дополнительные услуги для доставки груза от адреса - боковая погрузка (необязательные параметры)
            "arrivalServices":["0xb83b7589658a3851440a853325d1bf69"], // требуются дополнительные услуги для доставки груза до адреса - боковая погрузка (необязательные параметры)
            "quantity": 2 // количество мест (необязательно), по-умолчанию расчет производится для одного места
        ]
        
        let jsonData = try! NSJSONSerialization.dataWithJSONObject(json, options: [])
        
        // Create, config and perfom HTTP Request
        let url = NSURL(string: urlString)
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.addValue("application/json", forHTTPHeaderField: "Accept")
        //request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
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