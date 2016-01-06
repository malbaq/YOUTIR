//
//  Request.swift
//  YOUTIR
//
//  Created by Tom Malary on 1/4/16.
//  Copyright © 2016 YOUTIR LLC. All rights reserved.
//
/*
import Foundation

class RequestX {
    
    var fromCity: String
    var toCity: String
    var weight: Int
    var length: Int
    var width: Int
    var height: Int
    var insurance: Int
    
    init(fromCity: String, toCity: String, weight: Int, length: Int, width: Int, height: Int, insurance: Int) {
        self.fromCity = fromCity
        self.toCity = toCity
        self.weight = weight
        self.length = length
        self.width = width
        self.height = height
        self.insurance = insurance
    }
    
    func getQuoteFromPecom () -> String? {
        var provider = "Pecom"
        var response: String?
        // get locations
        // then get quote

        let url = NSURL(string: "https://kabinet.pecom.ru/api/v1/CALCULATOR/CALCULATEPRICE/")
        
        let request = NSMutableURLRequest(URL: url!)
        
        request.HTTPMethod = "POST"
        
        request.addValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            print(response)
        }

        
        task.resume()
        
        
            
        {
            "senderCityId": 446, // Код города отправителя [Number]
            "receiverCityId": 463, // Код города получателя [Number]
            "isOpenCarSender": false, // Растентовка отправителя [Boolean]
            "senderDistanceType": 0, // Тип доп. услуг отправителя [Number]
            // 0 - доп. услуги не нужны
            // 1 - СК
            // 2 - МОЖД
            // 3 - ТТК
            "isDayByDay": false, // Необходим забор день в день [Boolean]
            "isOpenCarReceiver": false, // Растентовка получателя [Boolean]
            "receiverDistanceType": 0, // Тип доп. услуг отправителя [Number]
            // кодируется аналогично senderDistanceType
            "isHyperMarket": false, // признак гипермаркета [Boolean]
            "calcDate": "2014-01-21", // расчетная дата [Date]
            "isInsurance": true, // Страхование [Boolean]
            "isInsurancePrice": 234.15, // Оценочная стоимость, руб [Number]
            "isPickUp": false, // Нужен забор [Boolean]
            "isDelivery": false, // Нужна доставка [Boolean]
            "Cargos": [{ // Данные о грузах [Array]
            "length": 2.1, // Длина груза, м [Number]
            "width": 3.2, // Ширина груза, м [Number]
            "height": 2.3, // Высота груза, м [Number]
            "volume": 4.4, // Объем груза, м3 [Number]
            "maxSize": 3.2, // Максимальный габарит, м [Number]
            "isHP": false, // Жесткая упаковка [Boolean]
            "sealingPositionsCount": 0, // Количество мест для пломбировки [Number]
            "weight": 10, // Вес, кг [Number]
            "overSize": false // Негабаритный груз [Boolean]
            }]
        }

        return response
    }
    
    func getQuoteFromDellin () -> String? {
        var provider = "Dellin"
        var response: String?
        // get locations
        // then get quote
        return response
    }

}*/