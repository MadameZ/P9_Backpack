//
//  Exchange.swift
//  Backpack
//
//  Created by Caroline Zaini on 31/07/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation


class Exchange {
 
    func checkForSameDate(exchange: ExchangeJSON) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.string(from: Date())
        
        guard exchange.date == date else {
            /// if not the same date return false
            return false
        }
        
        print("date " + date)
        return true
    }
   
}
