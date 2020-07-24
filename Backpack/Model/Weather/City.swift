//
//  City.swift
//  Backpack
//
//  Created by Caroline Zaini on 23/07/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation

typealias Cities = [City]

struct City : Decodable {
    let id: Int
    let name, country: String
}
