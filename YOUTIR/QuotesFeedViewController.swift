//
//  QuotesFeedViewController.swift
//  YOUTIR
//
//  Created by Tom Malary on 4/11/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class QuotesFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    //демо массив
    var arrayOfQuotes: [Quote] = [Quote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //демо массив
        self.setUpQuotes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //демо массив
        return arrayOfQuotes.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    //fake style cell, just to let it compile
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let quoteCell: QuoteTableViewCell = tableView.dequeueReusableCellWithIdentifier("quoteCell") as! QuoteTableViewCell
        
        let quote = arrayOfQuotes[indexPath.row]
        
        quoteCell.setQuoteCell(quote.carrierName, transitRate: quote.transitRate, transitTime: quote.transitTime, logoImagePath: quote.logoImagePath)
        
        // Переменная с членом массива, или просто объектом ставки (модель).
        // Распихиваем этот объект с его свойствами по вью, через ссылки контроллера.
        
        if indexPath.row % 2 == 0 {
            quoteCell.backgroundColor = UIColor.blueColor()
        } else {
            quoteCell.backgroundColor = UIColor.redColor()
        }
        
        return quoteCell
    }
    
    //устанавливаем демо массив
    func setUpQuotes() {
        var quote1 = Quote(carrierID: "CarrierID#1", carrierName: "PFX", transitRate: 5000, transitTime: 7, logoImagePath: "1.jpg")
        var quote2 = Quote(carrierID: "CarrierID#2", carrierName: "PECOM", transitRate: 6500, transitTime: 8, logoImagePath: "2.jpg")
        
        arrayOfQuotes.append(quote1)
        arrayOfQuotes.append(quote2)
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
