//
//  URLSessionFake.swift
//  BackpackTests
//
//  Created by Caroline Zaini on 21/07/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation

/// On double les classes responsable de l'appel réseau. URLSessionFake qui hérite de URLSession et URLSessionDataTaskFake qui hérite de URLSessionDataTask

// MARK: - URLSessionFake

class URLSessionFake : URLSession {
    /// On va doubler la méthode dataTask dont notre code a besoin pour fonctionner
    
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        /// 1. On crée une instance de URLSessionDataTaskFake pour utiliser notre double :
        let task = URLSessionDataTaskFake()
        /// 2. On configure notre fausse task :
        task.completionHandler = completionHandler
        task.data = data
        task.urlResponse = response
        task.responseError = error
        
        return task
    }
    
    // Variante de la func dataTask qui utilise URLRequest
    override func dataTask(with url: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
          /// 1. On crée une instance de URLSessionDataTaskFake pour utiliser notre double :
          let task = URLSessionDataTaskFake()
          /// 2. On configure notre fausse task :
          task.completionHandler = completionHandler
          task.data = data
          task.urlResponse = response
          task.responseError = error
          
          return task
      }
    
}




// MARK: - URLSessionDataTaskFake

class URLSessionDataTaskFake : URLSessionDataTask {
    /// On va doubler la méthode resume et cancel dont notre code a besoin pour fonctionner
    
    /// var completionHandler sera le bloc de retour : c'est une propriété qui aura le type du bloc de retour
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    var data: Data?
    var urlResponse: URLResponse?
    var responseError: Error?
    
    /// Comme c'est instantané, resume ne doit pas lancer l'appel mais appeler directement le bloc de retour avec les données ed la réponse donc le bloc (data, response, error) in ->  jusqu'à task?.resume() dans la func getExchange ou getTranslate ou getWeather
    /// Son rôle est dimplement d'appeler le bloc de retour
    override func resume() {
        completionHandler?(data, urlResponse, responseError)
    }
    
    /// Il n'y aura jamais d'appel en cours a annuler car cela a lieu instantanément. On laisse vide
    override func cancel() {}
    
}
