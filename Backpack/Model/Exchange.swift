//
//  Exchange.swift
//  Backpack
//
//  Created by Caroline Zaini on 26/03/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation

struct Exchange: Codable {
    static var shared = Exchange()
    private init() {}
    
    var base, date: String?
    var rate: [String:Double]?
}
