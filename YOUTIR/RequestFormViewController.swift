//
//  RequestFormViewController.swift
//  YOUTIR
//
//  Created by Tom Malary on 4/11/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class RequestFormViewController: UIViewController, UITextFieldDelegate {
    
    var request: Request?
    
    // Добавить UI didEndEditing in delegate. Сделать рамку поля красной.
    
    @IBOutlet var fromCityTextField: UITextField!
    @IBOutlet var toCityTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var lengthTextField: UITextField!
    @IBOutlet var widthTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var insuranceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Скрыть клаву по клику
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
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
        if textField.text.isEmpty {
            
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
        
        if fromCityTextField.text.isEmpty == true || toCityTextField.text.isEmpty == true || weightTextField.text.isEmpty == true || lengthTextField.text.isEmpty == true || widthTextField.text.isEmpty == true || heightTextField.text.isEmpty == true || insuranceTextField.text.isEmpty == true  {
            //alert
            println ("isEmpty check failed")
            var alert = UIAlertController(title: "One or more fields are empty", message: "You have to fill out this and this fields of the form.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
                alert.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)

        } else {
        
        // Запускается спинер
        
            var weight = weightTextField.text.toInt()!
            var length = lengthTextField.text.toInt()!
            var width = widthTextField.text.toInt()!
            var height = heightTextField.text.toInt()!
            var insurance = insuranceTextField.text.toInt()!
        
            request = Request(fromCity: fromCityTextField.text, toCity: toCityTextField.text, weight: weight, length: length, width: width, height: height, insurance: insurance)
            request!.save()
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