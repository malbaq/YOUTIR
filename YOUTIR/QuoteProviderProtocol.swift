//
//  QuoteProviderProtocol.swift
//  YOUTIR
//
//  Created by Tom Malary on 1/18/16.
//  Copyright © 2016 YOUTIR LLC. All rights reserved.
//

import Foundation

protocol QuoteProvider {
    func getQuoteFor(request: RequestX) -> QuoteX?
}