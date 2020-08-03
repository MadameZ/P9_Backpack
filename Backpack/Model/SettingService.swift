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
        static let cityID = "cityID"
    }
    
//     For choosen city :

    static var cityID: String {
        get {
            /// Recup the object. default operator, if it return nil so Key.cityID value is "5128638"
            return UserDefaults.standard.string(forKey: Key.cityID) ?? "5128638"
        } set {
            /// Save the object with the key, Key.cityID
            UserDefaults.standard.set(newValue, forKey: Key.cityID)
        }
    }
  
}
