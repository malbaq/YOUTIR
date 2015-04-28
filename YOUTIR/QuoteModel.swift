//
//  QuoteModel.swift
//  YOUTIR
//
//  Created by Tom Malary on 4/12/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import Foundation

class Quote: PFObject, PFSubclassing {
    @NSManaged var carrierID : String
    @NSManaged var carrierName : String
    @NSManaged var transitRate : Int
    @NSManaged var transitTime : Int
    @NSManaged var logoImagePath : String
    @NSManaged var carrierTel : Int
    @NSManaged var carrierWeb : String
    
    override class func initialize() {
        var onceToken : dispatch_once_t = 0;
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Quote"
    }
    
    override init() {
        super.init()
    }

    convenience init(carrierID: String, carrierName: String, transitRate: Int, transitTime: Int, logoImagePath: String, carrierTel: Int, carrierWeb: String) {
        self.init()
        self.carrierID = carrierID
        self.carrierName = carrierName
        self.transitRate = transitRate
        self.transitTime = transitTime
        self.logoImagePath = logoImagePath
        self.carrierTel = carrierTel
        self.carrierWeb = carrierWeb
    }
}