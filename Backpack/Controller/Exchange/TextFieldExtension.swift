//
//  textFieldExtension.swift
//  Backpack
//
//  Created by Caroline Zaini on 30/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

extension ExchangeViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard(_:)))
        self.view.addGestureRecognizer(tap)
        return true
    }
    
   
   @objc func hideKeyboard(_ gesture: UITapGestureRecognizer) {
       self.view.endEditing(true)
   }
    
}
