//
//  RequestFormViewController.swift
//  YOUTIR
//
//  Created by Tom Malary on 4/11/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class RequestFormViewController: UIViewController {
    
    @IBOutlet var fromCityTextField: UITextField!
    @IBOutlet var toCityTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var lengthTextField: UITextField!
    @IBOutlet var widthTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var insuranceTextField: UITextField!
    
    //reset all performing
    
    //prepare for segue getQuotes
//  Кликаем “show…”, Запускается спинер, Вызываем cloud func, Сервер рассылает по carriers’ api requests, Get the data, Send that to client, Мы распихиваем его по properties of quotes and detail VCs, Убираем спинер, Запускаем quotesVC. // Download the Instagram app from Udemy to learn the spinner.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
