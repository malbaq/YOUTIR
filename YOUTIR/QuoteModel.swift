//
//  QuoteModel.swift
//  YOUTIR
//
//  Created by Tom Malary on 4/12/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import Foundation

class Quote {
    var carrierID : String
    var carrierName : String
    var transitRate : Int
    var transitTime : Int
    var logoImagePath : String
    var carrierTel : Int
    var carrierWeb : String
    
    init(carrierID: String, carrierName: String, transitRate: Int, transitTime: Int, logoImagePath: String, carrierTel: Int, carrierWeb: String) {
        self.carrierID = carrierID
        self.carrierName = carrierName
        self.transitRate = transitRate
        self.transitTime = transitTime
        self.logoImagePath = logoImagePath
        self.carrierTel = carrierTel
        self.carrierWeb = carrierWeb
    }
}