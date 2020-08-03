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
    @IBOutlet weak var iconLocalIv: UIImageView!
    @IBOutlet weak var tempLocalLbl: UILabel!
    
    @IBOutlet weak var destListBtn: UIButton!
 
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var dateLbl: UILabel!
    
    var weather = Weather()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setupGradient()
        destListBtn.circle(destListBtn.frame.width / 2)

        dateLbl.text = weather.convertDate(date: Date())
        
        setupService()

    }
    
    @IBAction func destinationButtonTapped(_ sender: Any) {
        // To change the viewController :
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "cityListScreen") as! CityListViewController
        
        /// To use the datas passing with the delegate
        selectionVC.delegate = self
        present(selectionVC, animated: true, completion: nil)
       
        
    }
    
}

// MARK: - setup info destination

extension WeatherViewController {
    
     func setupService() {
           
           toggleActivityIndicator(shown: true)
        
           WeatherService.shared.getWeather { (success, weatherDetail) in
               if success, let weatherDetail = weatherDetail {
                   
                   self.toggleActivityIndicator(shown: false)
                   
                   let weatherNY = weatherDetail["newYork"]
                   let weatherLocal = weatherDetail["localCity"]
                   
                   self.setupNYInfo(weatherNY: weatherNY)
                   self.setupLocalInfo(weatherLocal: weatherLocal)
                   
               } else {
                   Alert.present(title: MessageError.connexionFailTitle, message: MessageError.connexionFailWeatherDesc, vc: self)
               }
           }
           
       }

       func setupNYInfo(weatherNY: WeatherJSON?) {

           guard let weatherNY = weatherNY else { return }
           
           var tempNY = weatherNY.main.temp
           tempNY = tempNY.rounded()
           
           nameNYLbl.text = weatherNY.name
           descNYLbl.text = weatherNY.weather[0].description.capitalized
           iconNYIv.image = weather.setImage(weatherNY.weather[0])
           tempNYLbl.text = String(tempNY) + " °"

       }
       
        func setupLocalInfo(weatherLocal: WeatherJSON?) {

            guard let weatherLocal = weatherLocal else { return }
    
            var tempLocal = weatherLocal.main.temp
            tempLocal = Double(round(10*tempLocal)/10)
            
            nameLocalLbl.text = weatherLocal.name
            descLocalLbl.text = weatherLocal.weather[0].description.capitalized
            iconLocalIv.image = weather.setImage(weatherLocal.weather[0])
            tempLocalLbl.text = String(tempLocal) + " °"
    
        }
    
}
  
// MARK: - Activity Indicator
  
extension WeatherViewController {
    
    func toggleActivityIndicator(shown: Bool) {
        activityIndicator.isHidden = !shown
        activityIndicator.startAnimating()
    }

}


extension WeatherViewController: ReceiveDataDelegate {
    func passCity(data: City) {
        /// update the name of the destination :
        nameNYLbl.text = data.name
        
        /// update automatically the weather after QoL delay :
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.setupService()
        }
    }
    
}


