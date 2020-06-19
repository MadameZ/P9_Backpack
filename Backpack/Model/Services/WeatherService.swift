//
//  WeatherService.swift
//  Backpack
//
//  Created by Caroline Zaini on 16/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation

class WeatherService {
    

    
    static var shared = WeatherService()
    private init() {}
    
    private static let weatherURL = "https://api.openweathermap.org/data/2.5/weather"

    private var task: URLSessionDataTask?
    
    private var weatherSession = URLSession(configuration: .default)
    private var weatherNYSession = URLSession(configuration: .default)
    
    init(weatherSession: URLSession, weatherNYSession: URLSession) {
        self.weatherSession = weatherSession
        self.weatherNYSession = weatherNYSession
    }
    
    
    // MARK: - create request
    
    private static func weatherRequest() -> URLRequest {

        let fullURL =  WeatherService.weatherURL + "?q=Nanterre,fr&lang=fr&units=metric&APPID=" + ApiKey.openWeather
            
        var request = URLRequest(url: URL(string: fullURL)!)
        request.httpMethod = "GET"

        return request
    }
    
 

    
    // MARK: - get the weather datas
    
    func getWeather(callback: @escaping (Bool, [String: WeatherJSON]?) -> Void) {
        
        let request = WeatherService.weatherRequest()
        
        task?.cancel()
        
        task = weatherSession.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                        callback(false, nil)
                        if let error = error {
                            print(error.localizedDescription)
                        }
                        return
                    }
                    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                        callback(false, nil)
                        print("No response from responseJSON")
                        return
                    }
                    
                    
                    guard let localWeather = try? JSONDecoder().decode(WeatherJSON.self, from: data) else {
                        callback(false, nil)
                        print("pas de responseJSON")
                        return
                        
                    }
                
                    /// Get the weather of New York
                    self.getNYWeather { (newYorkWeather) in
                        /// CHeck for the weatherNY object
                        guard let newYorkWeather = newYorkWeather else {
                            callback(false, nil)
                            return }
                        
                        /// Create an empty dictionnary
                            var weatherDetails: [String: WeatherJSON] = [:]
                        
                            /// Fill the dictionnary
                            weatherDetails["localCity"] = localWeather
                            weatherDetails["newYork"] = newYorkWeather
                        
                            /// Passing the ditionnary
                            callback(true, weatherDetails)
                    }
                      
                    
            }
 
        }
        task?.resume()
    }
    
    
    
    
    
    private func getNYWeather(completionHandler: @escaping (WeatherJSON?) -> Void) {
        
        let newYorkCityURL = WeatherService.weatherURL + "?id=5128638&fr&lang=fr&units=metric&APPID=" + ApiKey.openWeather
        var request = URLRequest(url: URL(string: newYorkCityURL)!)
               request.httpMethod = "GET"
        
        task? = weatherNYSession.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                    
                    completionHandler(nil)
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completionHandler(nil)
                    print("No response from weatherNYSession")
                    return
                }
                
                /// Check from JSON decoder
                guard let weatherNY = try? JSONDecoder().decode(WeatherJSON.self, from: data) else {
                    completionHandler(nil)
                    print("Failed to decode weatherNYJSON")
                    return
                }
                
                /// Passing weather object
                completionHandler(weatherNY)
            }
        }
        task?.resume()
     
    }
        
     
    
 
    
    
    

    
    
    
}
