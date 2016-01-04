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
        print("fuck viewDidLoad \(request)")
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
        
        quoteCell.setQuote(quote)
        
//        if indexPath.row % 2 == 0 {
//            quoteCell.backgroundColor = UIColor.blueColor()
//        } else {
//            quoteCell.backgroundColor = UIColor.redColor()
//        }
        
        return quoteCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let quote = arrayOfQuotes[indexPath.row]
        let detailTableViewController: DetailTableViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DetailTableViewController")as! DetailTableViewController

        detailTableViewController.quote = quote
        self.navigationController?.pushViewController(detailTableViewController, animated: true)
//        self.presentViewController(detailViewController, animated: true, completion: nil)
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    func setUpQuotes() {
        
        let query = Quote.query()
        
        query!.whereKey("transitRate", lessThanOrEqualTo: 6500)
        
        query!.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects as? [Quote] {
                    self.arrayOfQuotes = objects
                }
                print("the first quote is \(self.arrayOfQuotes[0])")
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