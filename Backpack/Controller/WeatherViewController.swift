//
//  WeatherViewController.swift
//  Backpack
//
//  Created by Caroline Zaini on 05/12/2019.
//  Copyright © 2019 Caroline Zaini. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    @IBOutlet weak var nameNYLbl: UILabel!
    @IBOutlet weak var descNYLbl: UILabel!
    @IBOutlet weak var iconNYIv: UIImageView!
    @IBOutlet weak var tempNYLbl: UILabel!
    
    @IBOutlet weak var nameLocalLbl: UILabel!
    @IBOutlet weak var descLocalLbl: UILabel!
    @IBOutlet weak var iconLocalLbl: UIImageView!
    @IBOutlet weak var tempLocalLbl: UILabel!
    
    
    var manager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
     
    }
    
    
    func setup() {
        
        WeatherService.shared.getWeather { (success, weatherDetail) in
            if success, let weatherDetail = weatherDetail {
                let weatherNY = weatherDetail["newYork"]
                let weatherLocal = weatherDetail["localCity"]
                
                self.setupWeatherInfo(weatherLocal: weatherLocal!, weatherNY: weatherNY!)
            } else {
                print("Erreur réseau")
            }
        }
        
    }
    
  
    
    // MARK: - setup info destination
    
    func setupWeatherInfo(weatherLocal: WeatherJSON, weatherNY: WeatherJSON) {
        
        print("success")
        
        nameLocalLbl.text = weatherLocal.name
        descLocalLbl.text = weatherLocal.weather[0].description
        tempLocalLbl.text = String(weatherLocal.main.temp) + "°"
        
        nameNYLbl.text = weatherNY.name
        descNYLbl.text = weatherNY.weather[0].description
        tempNYLbl.text = String(weatherNY.main.temp) + "°"
        
        
        
    }
    


}
