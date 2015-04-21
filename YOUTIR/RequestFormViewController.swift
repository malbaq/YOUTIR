//
//  RequestFormViewController.swift
//  YOUTIR
//
//  Created by Tom Malary on 4/11/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

//Надо из общих функциональностей:
//1. Управление клавой +++
//2. Ресет олл SKIPPED, Не критично
//3. Спиннер, скиппед
//4. Центровка вью при появлении клавы, скиппед
//5.
//6.
//7.
//8. 

class RequestFormViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var fromCityTextField: UITextField!
    @IBOutlet var toCityTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var lengthTextField: UITextField!
    @IBOutlet var widthTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var insuranceTextField: UITextField!
    
    //reset all
    
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showQuotesFeed") {
            let destinationVC: QuotesFeedViewController = segue.destinationViewController as! QuotesFeedViewController
            
            //destinationVC.arrayOfQuotes =
        }
    }
    
    @IBAction func getQuotes(sender: AnyObject) {
        //prepare for segue getQuotes
        
        //  Кликаем “show…”
        
        // Проверяем общзательные для заполнения поля 
        
        // Запускается спинер,
        
        // Создаем словарь с параметрами запроса пользователя
        var requestParam = [
            "origin" : fromCityTextField.text,
            "destination" : toCityTextField.text,
            "weight" : weightTextField.text,
            "length" : lengthTextField.text,
            "width" : widthTextField.text,
            "height" : heightTextField.text,
            "insurance" : insuranceTextField.text
        ]
        
        println(requestParam)
        
        // Вызываем cloud func и передаем ей пользовательский запрос
        let cloudFunctionResponse : AnyObject! = PFCloud.callFunction("getQuotes", withParameters: requestParam as [NSObject : AnyObject])
        
        println(cloudFunctionResponse)

        //Сервер рассылает по carriers’ api requests, Get the data back,
        
        //Send that to client, 
        
        //Мы распихиваем его по properties of quotes and detail VCs, 
        
        
        
        //Убираем спинер, 
        
        //Запускаем quotesVC. 
        
        // Download the Instagram app from Udemy to learn the spinner.

        
    }

}
