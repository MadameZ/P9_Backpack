//
//  FakeResponseData.swift
//  BackpackTests
//
//  Created by Caroline Zaini on 21/07/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

/// On crée FakeResponseData pour récupérer les données sur les fichiers json et les utiliser dans les tests
/// Cette classe doit simuler la réponse d'un serveur lors de nos appels réseaux
/// On doit simuler les 3 paramètres data, response et error

import Foundation

class FakeResponseData {
    
    // Bundel identifier
    private static let bundle = Bundle(for: FakeResponseData.self)
    
    // MARK: - simule le json renvoyé par Forismatic
    
    // For Exchange Fake Data
    static var exchangeCorrectData: Data? {
        /// Je demande le bundle qui cpontient le fichier de la classe dans laquelle je me trouve
        
        let url = bundle.url(forResource: "Exchange", withExtension: "json")!
        /// Je récupère les données contenues à cette url
        return try! Data(contentsOf: url)
    }
    
    // For Translate Fake Data
    static var translateCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Translate", withExtension: "json")!
        return try! Data(contentsOf: url)
    }
    
    // For Weather Fake Data
    static var weatherCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Weather", withExtension: "json")!
        return try! Data(contentsOf: url)
    }
    
    // MARK: - simule le json endommagé
    
    /// utf8 on renvoie une valeur de type data qui n'a rien à voir avec un json
    static var incorrectData = "error".data(using: .utf8)
    
 
    // MARK: - simule Response
    
    /// For correct HTTP Response :
    /// On met n'importe quelle URL
    static let responseOK = HTTPURLResponse(url: URL(string: "https://www.google.fr")!, statusCode: 200, httpVersion: nil, headerFields: nil)
    
    /// For incorrect HTTP Response :
    static let responseKO = HTTPURLResponse(url: URL(string: "https://www.google.fr")!, statusCode: 500, httpVersion: nil, headerFields: nil)
    
    /// For error :
    /// On s'interresse à la présence ou non d'un erreur. On crée une classe FakeError qui implémente le protocole Error et dont on ne peut pas obtenir une instance. Donc on crée une class pour obtenir une instance.
    class  FakeError: Error {}
    static let error = FakeError()
    
    
}
