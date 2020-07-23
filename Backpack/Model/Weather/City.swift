//
//  City.swift
//  Backpack
//
//  Created by Caroline Zaini on 23/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation


struct City {
    
    var cityCode: Int
    var name: String
    var country: String
    var cities: [City]
    
    init(name: String, country: String, cityCode: Int) {
        self.name = name
        self.country = country
        self.cityCode = cityCode
        self.cities = []
    }
    
    
 
    
}
