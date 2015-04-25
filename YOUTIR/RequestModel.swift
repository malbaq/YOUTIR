//
//  RequestModel.swift
//  YOUTIR
//
//  Created by Tom Malary on 4/20/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import Foundation

class Request : PFObject, PFSubclassing {
    
    @NSManaged var fromCity: String
    @NSManaged var toCity: String
    @NSManaged var weight: Int
    @NSManaged var length: Int
    @NSManaged var width: Int
    @NSManaged var height: Int
    @NSManaged var insurance: Int
    
    override class func initialize() {
        var onceToken : dispatch_once_t = 0;
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Request"
    }
    
    init(fromCity: String, toCity: String, weight: Int, length: Int, width: Int, height: Int, insurance: Int) {
        super.init()
        self.fromCity = fromCity
        self.toCity = toCity
        self.weight = weight
        self.length = length
        self.width = width
        self.height = height
        self.insurance = insurance
    }
}