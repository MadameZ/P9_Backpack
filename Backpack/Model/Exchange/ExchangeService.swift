//
//  ExchangeService.swift
//  Backpack
//
//  Created by Caroline Zaini on 27/03/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation

// Dans info.plist (pour autoriser http) : App transport security system -> YES

class ExchangeService {
    
    static var shared = ExchangeService()
    private init() {}
    

    private static let exchangeURL = "http://data.fixer.io/api/latest"
    
    private var task: URLSessionDataTask?
    
    /// property for injection of dependance. I keep this value for the app and use another value with URLSessionFake.
    private var exchangeSession = URLSession(configuration: .default)
    
    ///
    /// A REGARDER ATTENTIVEMENT :
    /// pour les tests, dans exchangeSession, on va injecter non pas des instances de URLSessions mais des instances de URLSessionFake.
    /// dans la classe URLSessionFake : les instances vont être initialiser avec l'init. Les données qu'on va lui passer sont des données qu'on a créer dans FakeResponseData
    /// Ensuite on appel la méthode getQuote puis va appeler une instance de quoteSession qui sera dans le cas des tests une instances de URLSessionFake. Donc la méthode qui va s'exécuter sera l'override de dataTask dans URLSessionFake
    /// la fonction resume sera de type URLSessionDataTaskFake
    /// create an init to keep those properties private.
    init(exchangeSession: URLSession) {
        self.exchangeSession = exchangeSession
    }
    
    
    // MARK: - create request
    
    private static func exchangeRequest() -> URLRequest {
        
        let fullURL = ExchangeService.exchangeURL + "?access_key=" + ApiKey.fixer
        
        var request = URLRequest(url: URL(string: fullURL)!)
        request.httpMethod = "GET"
        print(fullURL)
        return request
    }
    
    
    
    // MARK: - take the exchange
    
    func getExchange(callback: @escaping (Bool, ExchangeJSON?) -> Void) {
        
        let request = ExchangeService.exchangeRequest()
        
        
        task?.cancel()
        
        task = exchangeSession.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                guard let data = data, error == nil,
                    let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                        callback(false, nil)
                        print("No response from currency session")
                        return
                }
                guard let responseJSON = try? JSONDecoder().decode(ExchangeJSON.self, from: data) else {
                    callback(false, nil)
                    return
                }
                
                let base = responseJSON.base
                let date = responseJSON.date
                let rates = responseJSON.rates
                
                let exchange = ExchangeJSON(base: base , date: date, rates: rates)
         
                callback(true, exchange)
            }
            
        }
        task?.resume()
        
    }
    
    
}
