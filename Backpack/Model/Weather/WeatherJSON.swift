//
//  Weather.swift
//  Backpack
//
//  Created by Caroline Zaini on 17/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation


struct WeatherJSON: Decodable {
    
    var weather: [WeatherData]
    var main: Main
    var name: String
    
}

struct WeatherData: Decodable {
 
    var description: String
    var icon: String
    var id: Int
    var main: String
    
}

struct Main: Decodable {
    let temp: Double
}




//func updateWeatherIcon(id: Int) -> String {
//    switch id {
//    case 200...232:
//        return "storm"
//    case 301...311:
//        return "rain-1"
//    case 312...321:
//        return "rain-2"
//    case 500...531:
//        return "rain"
//    default:
//        <#code#>
//    }
//}

/*
 
 {
     "coord": {
         "lon": 2.35,
         "lat": 48.85
     },
     "weather": [
         {
             "id": 804,
             "main": "Clouds",
             "description": "couvert",
             "icon": "04d"
         }
     ],
     "base": "stations",
     "main": {
         "temp": 18.53,
         "feels_like": 17.84,
         "temp_min": 18,
         "temp_max": 19.44,
         "pressure": 1013,
         "humidity": 68
     },
     "visibility": 10000,
     "wind": {
         "speed": 2.1,
         "deg": 210
     },
     "clouds": {
         "all": 90
     },
     "dt": 1592383676,
     "sys": {
         "type": 1,
         "id": 6550,
         "country": "FR",
         "sunrise": 1592365593,
         "sunset": 1592423800
     },
     "timezone": 7200,
     "id": 2988507,
     "name": "Paris",
     "cod": 200
 }
 
 */
