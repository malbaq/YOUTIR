//
//  ManagerViewController.swift
//  YOUTIR
//
//  Created by Tom Malary on 1/19/16.
//  Copyright © 2016 YOUTIR LLC. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var providers = [QuoteProvider]() // Create empty [providers]
        var pecom = Pecom() // Create Providers instances
        var isTrue = pecom.getCityIDFor("Степное", isSenderCity: true) // getCityIds
        // if true then append that provider to [providers]
        if isTrue == true {
            providers.append(pecom)
        }
        // Probably here we have already had Request ...
        
        // if there is any in [providers] then create Manager with [providers]
        if providers.count >= 1 {
            var manager = QuoteManager(providers: providers)
            // then Manager -> Quote...
            //manager.fetch(<#T##request: RequestX##RequestX#>)

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
