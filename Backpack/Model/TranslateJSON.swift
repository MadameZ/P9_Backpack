//
//  TranslateJSON.swift
//  Backpack
//
//  Created by Caroline Zaini on 23/07/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation


struct TranslateJSON: Decodable  {
    var data: DataExchange
    
}

struct DataExchange: Decodable {
    var translations: [Translation]
}

struct Translation: Decodable {
    
    var translatedText: String
    var detectedSourceLanguage: String
    
}

/**
 
 {
   "data": {
     "translations": [
       {
         "translatedText": "Buenos dias",
         "detectedSourceLanguage": "fr"
       }
     ]
   }
 }
 
 */

