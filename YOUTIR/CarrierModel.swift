//
//  CarrierModel.swift
//  YOUTIR
//
//  Created by Tom Malary on 4/28/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import Foundation

class Carrier: PFObject, PFSubclassing {
    @NSManaged var carrierID : String
    @NSManaged var carrierName : String
    @NSManaged var logoImage: PFFile?
    @NSManaged var carrierTel : Int
    @NSManaged var carrierWeb : String
    
    override class func initialize() {
        var onceToken : dispatch_once_t = 0;
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Carrier"
    }
    
    override init() {
        super.init()
    }
    
    convenience init(carrierID: String, carrierName: String, logoImage: PFFile, carrierTel: Int, carrierWeb: String) {
        self.init()
        self.carrierID = carrierID
        self.carrierName = carrierName
        self.logoImage = logoImage
        self.carrierTel = carrierTel
        self.carrierWeb = carrierWeb
    }
}