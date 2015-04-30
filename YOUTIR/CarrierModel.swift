//
//  CarrierModel.swift
//  YOUTIR
//
//  Created by Tom Malary on 4/28/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import Foundation

class Carrier: PFObject, PFSubclassing {
    @NSManaged var youtirID: String
    @NSManaged var name: String
    @NSManaged var logoImage: PFFile
    @NSManaged var telephone: String
    @NSManaged var web: String
    
//    func logoImageView() -> PFImageView {
//        let view = PFImageView(image: UIImage(named: "placeholder"))
//        view.file = logoImage
//        view.loadInBackground(nil)
//        return view
//    }
    
    override class func initialize() {
        var onceToken : dispatch_once_t = 0;
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Carrier"
    }
}