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
    @IBOutlet var logoImage: PFImageView!
    @IBOutlet var carrierTelLabel: UILabel!
    @IBOutlet var carrierWebLabel: UILabel!
    @IBOutlet var requestSpecsLabel: UILabel!

    //test the pointer, should be deleted later
    @IBOutlet var testRequestPointer: UILabel!
    
    var quote: Quote!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        quote.fetchIfNeeded()
        self.carrierNameLabel.text = quote.carrier["name"] as! String
        self.transitRateLabel.text = String(quote.transitRate)
        self.transitTimeLabel.text = String(quote.transitTime)
        self.carrierTelLabel.text = quote.carrier["telephone"] as! String
        self.carrierWebLabel.text = quote.carrier["web"] as! String
        self.logoImage.image = UIImage(named: "placeholder")
        
        let logoImageFile = quote.carrier["logoImage"] as! PFFile
        logoImageFile.getDataInBackgroundWithBlock {
            (imageData: NSData?, error: NSError?) -> Void in
            if error == nil {
                if let imageData = imageData {
                    self.logoImage.image = UIImage(data: imageData)
                }
            }
        }
        
       
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
