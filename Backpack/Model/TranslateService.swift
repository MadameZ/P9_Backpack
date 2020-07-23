//
//  TranslateService.swift
//  Backpack
//
//  Created by Caroline Zaini on 26/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation


class TranslateService {
    
    
    static var shared = TranslateService()
    private init() {}
    
    private static let translateURL = "https://translation.googleapis.com/language/translate/v2"
    
    private var task: URLSessionDataTask?
    
    private var translateSession = URLSession(configuration: .default)
    
    init(translateSession: URLSession) {
        self.translateSession = translateSession
    }
    
    // MARK: - create request
    
    private static func translateRequest(text: String) -> URLRequest {

   
        var request = URLRequest(url: URL(string: TranslateService.translateURL)!)
        let body = "key=\(ApiKey.googleTranslate)&q=\(text)&target=en"
        request.httpMethod = "POST"
        /// Add the body
        request.httpBody = body.data(using: .utf8)
        print(request)
        return request
    }
    
    // MARK: - get the weather datas
       
    func getTranslate(text: String, callback: @escaping (Bool, String?) -> Void) {
           
        let request = TranslateService.translateRequest(text: text)
           
           task?.cancel()
           /// Set task
           task = translateSession.dataTask(with: request) { (data, response, error) in
               /// Return in the main queue
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
                        print("No response from translateJSON")
                        return
                    }


                    guard let translateJSON = try? JSONDecoder().decode(TranslateJSON.self, from: data) else {
                        callback(false, nil)
                        print("pas de translateJSON")
                        return
                    }
                
                    /// Create the string
                    let textToDecode = translateJSON.data.translations.first!.translatedText
                    /// Get the translation texte
                    callback(true, textToDecode)
                      
               }
    
           }
           task?.resume()
       }
    
    
    
}
