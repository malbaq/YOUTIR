//
//  DetailTableViewController.swift
//  YOUTIR
//
//  Created by Tom Malary on 5/9/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController, PFLogInViewControllerDelegate {
    
    @IBOutlet var carrierNameLabel: UILabel!
    @IBOutlet var transitRateLabel: UILabel!
    @IBOutlet var transitTimeLabel: UILabel!
    @IBOutlet var logoImage: PFImageView!
    @IBOutlet var carrierTelLabel: UILabel!
    @IBOutlet var carrierWebLabel: UILabel!
    @IBOutlet var fromCityLabel: UILabel!
    @IBOutlet var toCityLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var lengthLabel: UILabel!
    @IBOutlet var widthLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var insuranceLabel: UILabel!
    
    var quote: Quote!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        quote.fetchIfNeeded()
        self.carrierNameLabel.text = quote.carrier["name"] as! String
        self.transitRateLabel.text = String(quote.transitRate)
        self.transitTimeLabel.text = String(quote.transitTime)
        self.carrierTelLabel.text = quote.carrier["telephone"] as! String
        self.carrierWebLabel.text = quote.carrier["web"] as! String
        self.logoImage.image = UIImage(named: "placeholder")
        
        quote.request.fetchIfNeeded()

        self.fromCityLabel.text = quote.request.fromCity
        self.toCityLabel.text = quote.request.toCity
        self.weightLabel.text = String(quote.request.weight)
        self.lengthLabel.text = String(quote.request.length)
        self.widthLabel.text = String(quote.request.width)
        self.heightLabel.text = String(quote.request.height)
        self.insuranceLabel.text = String(quote.request.insurance)
        
        let logoImageFile = quote.carrier["logoImage"] as! PFFile
        logoImageFile.getDataInBackgroundWithBlock {
            (imageData: NSData?, error: NSError?) -> Void in
            if error == nil {
                if let imageData = imageData {
                    self.logoImage.image = UIImage(data: imageData)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete method implementation.
//        // Return the number of rows in the section.
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    func callForLogin() {
        
        let logInController = LoginViewController()
        logInController.signUpController = SignUpViewController()
        
        logInController.delegate = self
        
        logInController.facebookPermissions = ["email", "public_profile"]
        
        logInController.fields = ([PFLogInFields.UsernameAndPassword, PFLogInFields.LogInButton, PFLogInFields.SignUpButton, PFLogInFields.PasswordForgotten, PFLogInFields.DismissButton, PFLogInFields.Facebook])
        
        self.presentViewController(logInController, animated:true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewControllerDidCancelLogIn(controller: PFLogInViewController) -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func placeOrderButtonPressed(sender: AnyObject) {
        if PFUser.currentUser() == nil {
            let alert = UIAlertController(title: "Need to be authorized", message: "To place an order you have to authorize first", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                alert.dismissViewControllerAnimated(true, completion: nil)
                self.callForLogin()
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) -> Void in
                alert.dismissViewControllerAnimated(true, completion: nil)
            })
            
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            self.callForLogin()
            // self.paypalVCCalling()
        }
    }
}
