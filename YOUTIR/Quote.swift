//
//  Quote.swift
//  YOUTIR
//
//  Created by Tom Malary on 1/18/16.
//  Copyright © 2016 YOUTIR LLC. All rights reserved.
//

import Foundation

class QuoteX {
    var transitRate: Int
    var transitTime: Int
    var request: RequestX
    var carrier: QuoteProvider
    
    init(transitRate: Int, transitTime: Int, request: RequestX, carrier: QuoteProvider) {
        self.transitRate = transitRate
        self.transitTime = transitTime
        self.request = request
        self.carrier = carrier
    }
}