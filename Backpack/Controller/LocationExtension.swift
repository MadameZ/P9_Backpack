//
//  LocationExtension.swift
//  Backpack
//
//  Created by Caroline Zaini on 18/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation
import CoreLocation

//extension WeatherViewController: CLLocationManagerDelegate {
//    
//    func setup() {
//        manager.delegate = self
//        manager.requestAlwaysAuthorization()
//        manager.startUpdatingLocation()
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//        guard let location = locations.last else { return }
//        manager.startUpdatingLocation()
//        
//        let coords = location.coordinate
//        
//        WeatherService.shared.getWeather(coords.latitude, coords.longitude) { (success, weatherJSONResult) in
//            if success, let weatherJSONResult = weatherJSONResult {
//                self.setupWeatherInfo(weather: weatherJSONResult)
//            } else {
//                print("pas d'affichage")
//            }
//        }
//        
//    }
//    
//}
