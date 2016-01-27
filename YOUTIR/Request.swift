//
//  Request.swift
//  YOUTIR
//
//  Created by Tom Malary on 1/18/16.
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
}