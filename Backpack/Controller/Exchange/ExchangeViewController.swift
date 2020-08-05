//
//  ExchangeViewController.swift
//  Backpack
//
//  Created by Caroline Zaini on 05/12/2019.
//  Copyright © 2019 Caroline Zaini. All rights reserved.
//

import UIKit

class ExchangeViewController: UIViewController {

    @IBOutlet weak var convertLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var exchangeBtn: UIButton!
    @IBOutlet weak var date: UILabel!
    
    var exchange = Exchange()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setupGradient()
        exchangeBtn.circle(5)
        amountTextField.delegate = self   
    }
    
    func setupService() {
        
        ExchangeService.shared.getExchange { (success, exchange) in
            
            if success, let dataExchange = exchange {

                guard self.exchange.checkForSameDate(exchange: dataExchange) else { return }
                self.convert(dataExchange)

            } else {
                Alert.present(title: MessageError.connexionFailTitle , message: MessageError.connexionFailExchangeDesc , vc: self)
            }
        }
        
    }
    
    @IBAction func didTapConvertBtn(_ sender: Any) {
        setupService()
        view.endEditing(true)
    }
    
    
    
    // MARK: - convert
    
     func convert(_ exchange: ExchangeJSON)  {

        guard let text = amountTextField.text, text != "" else {
         return Alert.present(title: MessageError.wrongInputTitle, message: MessageError.wrongInputDesc, vc: self)}

        /// Replace , by a .
        let replaced = text.replacingOccurrences(of: ",", with: ".")
        guard let textDouble = Double(replaced) else { return }
        /// Convert the EUR in USD
        let result = textDouble * exchange.rates["USD"]!
        /// String rounded to 2 decimal
        convertLabel.text = String(format: "%.2f", result)
     }
}


