//
//  ExchangeJSON.swift
//  Backpack
//
//  Created by Caroline Zaini on 29/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation

struct ExchangeJSON: Decodable {
    /// use only infos we need
    var base: String
    var date: String
    var rates: [String: Double]
    
  
    
// A VOIR POUR METTRE LA LOGIC DANS LE MODEL :
    
    mutating func convert(amount: String?, exchange: ExchangeJSON) -> String {

        guard let text = amount else { return "" }

        /// Replace , by a .
        let replaced = text.replacingOccurrences(of: ",", with: ".")
        guard let textDouble = Double(replaced) else { return "" }
        /// Convert the EUR in USD
        let result = textDouble * exchange.rates["USD"]!
        /// String rounded to 2 decimal
        return String(format: "%.2f", result)

      }
    
}
