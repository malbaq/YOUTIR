//
//  DetailViewController.swift
//  YOUTIR
//
//  Created by Tom Malary on 4/13/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var carrierNameLabel: UILabel!
    @IBOutlet var transitRateLabel: UILabel!
    @IBOutlet var transitTimeLabel: UILabel!
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var carrierTelLabel: UILabel!
    @IBOutlet var carrierWebLabel: UILabel!

    //test the pointer, should be deleted later
    @IBOutlet var testRequestPointer: UILabel!
    
    var carrierName: String?
    var transitRate: Int?
    var transitTime: Int?
    var logoImagePath: String?
    var carrierTel: String?
    var carrierWeb: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.carrierNameLabel.text = carrierName
        self.transitRateLabel.text = String(transitRate!)
        self.transitTimeLabel.text = String(transitTime!)
        self.logoImage.image = UIImage(named: logoImagePath!)
        self.carrierTelLabel.text = String(carrierTel!)
        self.carrierWebLabel.text = String(carrierWeb!)
        
        // To check if PFUser != nil then show pay else show login using alpha method 0 or 1, or text and func of the same button + alpha for name of the user name and logout button alpha.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
