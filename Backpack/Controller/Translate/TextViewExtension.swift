//
//  TextViewExtension.swift
//  Backpack
//
//  Created by Caroline Zaini on 30/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

extension TranslateViewController: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard(_:)))
        self.view.addGestureRecognizer(tap)
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    @objc func hideKeyboard(_ gesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
         
    }
    
}
