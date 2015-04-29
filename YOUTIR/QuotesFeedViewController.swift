//  QuotesFeedViewController.swift
//  YOUTIR
//
//  Created by Tom Malary on 4/11/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.


import UIKit

class QuotesFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var request: Request!
    
    var arrayOfQuotes: [Quote] = [Quote](){
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpQuotes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfQuotes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let quoteCell: QuoteTableViewCell = tableView.dequeueReusableCellWithIdentifier("quoteCell") as! QuoteTableViewCell
        
        let quote = arrayOfQuotes[indexPath.row]
        
//        //to convert logoImage from PFFile to NSData
//        // var imageData : NSData?
//        var logoImage = quote.carrier.logoImage as PFFile
//        logoImage.getDataInBackgroundWithBlock {
//            (imageData: NSData?, error: NSError?) -> Void in
//            if error == nil {
//                var imageData = imageData
//            }
//        }
        
        quoteCell.setQuoteCell(quote.carrier.name, transitRate: quote.transitRate, transitTime: quote.transitTime, logoImage: )
        
        if indexPath.row % 2 == 0 {
            quoteCell.backgroundColor = UIColor.blueColor()
        } else {
            quoteCell.backgroundColor = UIColor.redColor()
        }
        
        return quoteCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let quote = arrayOfQuotes[indexPath.row]
        var detailViewController: DetailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController")as! DetailViewController
        
        detailViewController.carrierName = quote.carrier.name
        detailViewController.transitRate = quote.transitRate
        detailViewController.transitTime = quote.transitTime
//        detailViewController.logoImagePath = quote.carrier.logoImage
        detailViewController.carrierTel = quote.carrier.telephone
        detailViewController.carrierWeb = quote.carrier.web
        
        self.presentViewController(detailViewController, animated: true, completion: nil)
    }

    func setUpQuotes() {
        
        var query = Quote.query()
        
        query!.whereKey("transitRate", greaterThanOrEqualTo: 6500)
        
        query!.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects as? [Quote] {
                    self.arrayOfQuotes = objects
                }
                println("the first quote is \(self.arrayOfQuotes[0])")
            }
        }
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