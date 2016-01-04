//
//  Request.swift
//  YOUTIR
//
//  Created by Tom Malary on 1/4/16.
//  Copyright © 2016 YOUTIR LLC. All rights reserved.
//

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
        return response
    }
    
    func getQuoteFromDellin () -> String? {
        var provider = "Dellin"
        var response: String?
        // get locations
        // then get quote
        return response
    }

}