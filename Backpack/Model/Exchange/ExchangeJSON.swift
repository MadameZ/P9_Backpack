//
//  ExchangeJSON.swift
//  Backpack
//
//  Created by Caroline Zaini on 29/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation

/// Decodable is a protocol to decode JSON

struct ExchangeJSON: Decodable {
    /// use only infos we need
    var base: String
    var date: String
    var rates: [String: Double]
     
}
