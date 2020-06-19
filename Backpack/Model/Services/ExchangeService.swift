//
//  ExchangeService.swift
//  Backpack
//
//  Created by Caroline Zaini on 27/03/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation

class ExchangeService {
    
    static var shared = ExchangeService()
    private init() {}
    

    private let exchangeURL = "http://data.fixer.io/api/latest?access_key=ceaad78d3a976a4bc4bb34c9c796fea4"
    
    private var task: URLSessionDataTask?
    
    private var exchangeSession = URLSession(configuration: .default)
    
    init(exchangeSession: URLSession) {
        self.exchangeSession = exchangeSession
    }
    
    // MARK: - take the exchange
    
     func getExchange(callback: @escaping (Bool, Data?) -> Void) {
        
        guard let url = URL(string: exchangeURL) else {
            callback(false, nil)
            return
        }
        
        task?.cancel()
        
        task = exchangeSession.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil,
                    let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                        callback(false, nil)
                        print("No response from currency session")
                        return
                }
                guard let responseJSON = try? JSONDecoder().decode(Exchange.self, from: data) else {
                    callback(false, nil)
                    return
                }
                Exchange.shared.base = responseJSON.base
                Exchange.shared.date = responseJSON.date
                Exchange.shared.rate = responseJSON.rate
                callback(true, data)
            }
            
        }
        task?.resume()
        
    }
    
    
}
