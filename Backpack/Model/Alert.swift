//
//  Alert.swift
//  Backpack
//
//  Created by Caroline Zaini on 30/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

struct Alert {
    
    static func present(title: String, message: String, vc: UIViewController) {
        let alertVC =  UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        vc.present(alertVC, animated: true, completion: nil)
    }
    
}


