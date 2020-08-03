//
//  MessageError.swift
//  Backpack
//
//  Created by Caroline Zaini on 30/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation

struct MessageError {
    
    // MARK: - error messages for exchange
    static let connexionFailTitle = "Vérifiez votre connexion"
    static let connexionFailExchangeDesc = "Le taux de change n'a pas été récupéré"
    static let wrongInputTitle = "Erreur de saisie"
    static let wrongInputDesc = "Veuillez rentrer au moins un chiffre"
    
    // MARK: - error messages for translate
    static let connexionFailTranslateDesc = "La traduction n'a pas pu se faire"

    // MARK: - error messages for weather
    static let connexionFailWeatherDesc = "Les infos météo n'ont pas été récupéré"
}
