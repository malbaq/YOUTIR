//
//  RequestFormTableViewController.swift
//  YOUTIR
//
//  Created by Tom Malary on 5/8/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import Alamofire // To test Alamofire

import UIKit

class RequestFormTableViewController: UITableViewController, UITextFieldDelegate {
    
    var request: Request?
    
    // Добавить UI didEndEditing in delegate. Сделать рамку поля красной
    
    @IBOutlet var fromCityTextField: UITextField!
    @IBOutlet var toCityTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var lengthTextField: UITextField!
    @IBOutlet var widthTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var insuranceTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(<#T##method: Method##Method#>, <#T##URLString: URLStringConvertible##URLStringConvertible#>, parameters: <#T##[String : AnyObject]?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##[String : String]?#>)
        
//        //////// from here
//        let json = ["title": "Степное"]
//        let theJSONData = try! NSJSONSerialization.dataWithJSONObject(
//            json ,
//            options: NSJSONWritingOptions(rawValue: 0))
//        let theJSONText = NSString(data: theJSONData,
//            encoding: NSUTF8StringEncoding)
//        print("JSON string = \(theJSONText!)")
//        
//        var dellin = DellinRequest()
//        dellin.getDellinQuote()
//        
//        let jsonХ = [
//            "title": "Степное"
//        ] as Dictionary
//        
//        let jsonData = try! NSJSONSerialization.dataWithJSONObject(json, options: [])
//        print(json)
//        print(theJSONText!)
//        // Config Basic Auth
//        let username = "malbaq"
//        let password = "8F102968198C7999F7AF8840FE7B44D2F4BBAD81"
//        let loginString = NSString(format: "%@:%@", username, password)
//        let loginData: NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
//        let base64LoginString = loginData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.init(rawValue: 0))
//        
//        // Create, config and perfom HTTP Request
//        let url = NSURL(string: "https://kabinet.pecom.ru/api/v1/BRANCHES/FINDBYTITLE/")
//        let request = NSMutableURLRequest(URL: url!)
//        request.HTTPMethod = "POST"
//        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
//        request.HTTPBody = theJSONData
//        let session = NSURLSession.sharedSession()
//        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
//        
//            if let response = response {
//                print("the response is \(response)")
//            }
//        }
//        
//        task.resume()
//        
//        ///// <->till here

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
    
    //Скрыть клаву по клику
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // called when 'return' key pressed to СКРЫТЬ КЛАВУ. return NO to ignore.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        fromCityTextField.resignFirstResponder()
        toCityTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
        lengthTextField.resignFirstResponder()
        widthTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
        insuranceTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField.text!.isEmpty {
            
//            textField.layer.borderWidth = 1.0
//            textField.layer.borderColor = UIColor.redColor().CGColor
            
            textField.backgroundColor = UIColor.redColor()
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.backgroundColor = UIColor.whiteColor()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showQuotesFeed") {
            
            let nav = segue.destinationViewController as! UINavigationController
            let quotesFeedViewController: QuotesFeedViewController = nav.topViewController as! QuotesFeedViewController
            
            quotesFeedViewController.request = self.request
            
        }
    }
    
    @IBAction func sendRequest(sender: AnyObject) {
        
        // Проверяем обязательные для заполнения поля
        
        if fromCityTextField.text!.isEmpty == true || toCityTextField.text!.isEmpty == true || weightTextField.text!.isEmpty == true || lengthTextField.text!.isEmpty == true || widthTextField.text!.isEmpty == true || heightTextField.text!.isEmpty == true || insuranceTextField.text!.isEmpty == true  {
            //alert
            print ("isEmpty check failed")
            var alert = UIAlertController(title: "One or more fields are empty", message: "You have to fill out this and this fields of the form.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
                alert.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            
            // Запускается спинер
            
            var weight = Int(weightTextField.text!)!
            var length = Int(lengthTextField.text!)!
            var width = Int(widthTextField.text!)!
            var height = Int(heightTextField.text!)!
            var insurance = Int(insuranceTextField.text!)!
            
            request = Request(fromCity: fromCityTextField.text!, toCity: toCityTextField.text!, weight: weight, length: length, width: width, height: height, insurance: insurance)
            try! request!.save()
            //save in background...
            
            self.performSegueWithIdentifier("showQuotesFeed", sender: self)
        }
    }
    
    
    @IBAction func resetAll(sender: AnyObject) {
        fromCityTextField.text = ""
        toCityTextField.text = ""
        weightTextField.text = ""
        lengthTextField.text = ""
        widthTextField.text = ""
        heightTextField.text = ""
        insuranceTextField.text = ""
    }
}


