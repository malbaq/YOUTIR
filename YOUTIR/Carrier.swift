//
//  CarrierModel.swift
//  YOUTIR
//
//  Created by Tom Malary on 4/28/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import Foundation

class CarrierX {
    var carrierID: String
    var name: String
    var logoImagePath: String
    var telephone: String
    var web: String
    
    init(carrierID: String, name: String, logoImagePath: String, telephone: String, web: String) {
        self.carrierID = carrierID
        self.name = name
        self.logoImagePath = logoImagePath
        self.telephone = telephone
        self.web = web
    }
}