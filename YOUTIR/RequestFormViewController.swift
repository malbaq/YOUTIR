//
//  RequestFormViewController.swift
//  YOUTIR
//
//  Created by Tom Malary on 4/11/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class RequestFormViewController: UIViewController, UITextFieldDelegate {
    
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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   /* override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showQuotesFeed") {
            let destinationVC: QuotesFeedViewController = segue.destinationViewController as! QuotesFeedViewController
            
            //destinationVC.arrayOfQuotes =
        }
    }*/
    
    @IBAction func sendRequest(sender: AnyObject) {
        
        // Проверяем общзательные для заполнения поля
        /*
        if fromCityTextField.text == nil || toCityTextField.text == nil || weightTextField.text == nil || lengthTextField.text == nil || widthTextField.text == nil || heightTextField.text == nil || insuranceTextField.text == nil  {
            alert
            println ("fucking arbeiten")
        } else {
            see below
        }
        */
        
        // Запускается спинер
        
        var weight = weightTextField.text.toInt()!
        var length = lengthTextField.text.toInt()!
        var width = widthTextField.text.toInt()!
        var height = heightTextField.text.toInt()!
        var insurance = insuranceTextField.text.toInt()!
        
        var request = Request(fromCity: fromCityTextField.text, toCity: toCityTextField.text, weight: weight, length: length, width: width, height: height, insurance: insurance)
        request.save()
        
        self.performSegueWithIdentifier("showQuotesFeed", sender: self)

    }
    
    
    @IBAction func resetAll(sender: AnyObject) {
        fromCityTextField.text = nil
        toCityTextField.text = nil
        weightTextField.text = nil
        lengthTextField.text = nil
        widthTextField.text = nil
        heightTextField.text = nil
        insuranceTextField.text = nil
    }

}