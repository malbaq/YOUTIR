//
//  QuoteManager.swift
//  YOUTIR
//
//  Created by Tom Malary on 1/19/16.
//  Copyright © 2016 YOUTIR LLC. All rights reserved.
//

import Foundation

class QuoteManager {
    
    var providers: [QuoteProvider]
    
    func fetch(request: RequestX) -> [QuoteX]? {
        let quotes = [QuoteX]()
        for provider in providers {
            provider.getQuoteFor(request)
        }
        return quotes
    }
    init (providers: [QuoteProvider]) {
        self.providers = providers
    }
}