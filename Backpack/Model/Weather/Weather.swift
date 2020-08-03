//
//  WeatherAppearance.swift
//  Backpack
//
//  Created by Caroline Zaini on 31/07/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit


class Weather {
    
    // MARK: - set the icon
    
    func setImage(_ weatherData: WeatherData) -> UIImage {
          
          let icon = weatherData.main
          
          switch icon {
          case "Clear": return #imageLiteral(resourceName: "Clear")
          case "Clouds": return #imageLiteral(resourceName: "Clouds")
          case "Mist": return #imageLiteral(resourceName: "Snow")
          case "Rain": return #imageLiteral(resourceName: "Rain")
          case "Thunderstorm": return #imageLiteral(resourceName: "Thunderstorm")
          case "Drizzle": return #imageLiteral(resourceName: "Drizzle")
          case "Snow": return #imageLiteral(resourceName: "Snow")
          default:
              print("image error")
          }
          
          /// For all the rest
          return #imageLiteral(resourceName: "Image")
      }
    
     func convertDate(date: Date) -> String {
        
          let formatter = DateFormatter()
          formatter.dateStyle = .medium
          formatter.timeStyle = .none
          // Pour avoir une date en français
          formatter.locale = Locale(identifier: "fr_FR")

          return formatter.string(from: date)
    }
      
    
}
