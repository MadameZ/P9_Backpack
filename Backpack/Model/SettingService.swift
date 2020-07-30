//
//  SettingService.swift
//  Backpack
//
//  Created by Caroline Zaini on 29/07/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation

class SettingService {
    
    private struct Key {
        static let city = "city"
        static let cityID = "cityID"
    }
    

    
    
//     For choosen city :

    
    static var cityID: String {
        get {
            return UserDefaults.standard.string(forKey: Key.cityID) ?? "5128638"
        } set {
            UserDefaults.standard.set(newValue, forKey: Key.cityID)
        }

    }
    
    
}
