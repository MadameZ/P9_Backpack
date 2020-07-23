//
//  WeatherServiceTestCase.swift
//  BackpackTests
//
//  Created by Caroline Zaini on 22/07/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation
import XCTest
@testable import Backpack

class WeatherServiceTestCase: XCTestCase {
    
  // MARK: - Cas où il y a une erreur
    
    /// On envoit un callback d'erreur. En cas d'erreur on s'arrête tout de suite.
    func testGetWeatherShouldPostFailedCallbackError() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error), weatherNYSession: URLSessionFake(data: nil, response: nil, error: nil))
        
        // When
        /// On a un micro décalage car on n'est pas dans la même queue donc on fait une expectation. Les expectation servent à attendre.
        let expectation = XCTestExpectation(description: "Wait for queue change")
        
        weatherService.getWeather { (success, weatherDetails) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(weatherDetails)
            /// l'expectation est terminé
            expectation.fulfill()
        }
        
        /// le micro délais 0.01 ne va pas ralentir nos tests.
        wait(for: [expectation], timeout: 0.01)
    }
    
    // MARK: - Cas où le callback d'erreur est bien envoyé
    
    // Cas où il n'y a pas de donnée :
    
    func testGetWeatherShouldPostFailedCallbackIfNoData() {
           // Given
            let weatherService = WeatherService(weatherSession: URLSessionFake(data: nil, response: nil, error: nil), weatherNYSession: URLSessionFake(data: nil, response: nil, error: nil))
               
           // When
           let expectation = XCTestExpectation(description: "Wait for queue change")
           weatherService.getWeather { (success, weatherDetails) in
                   // Then
                   XCTAssertFalse(success)
                   XCTAssertNil(weatherDetails)
                   /// l'expectation est terminé
                   expectation.fulfill()
           }
               
               /// le micro délais 0.01 ne va pas ralentir nos tests.
               wait(for: [expectation], timeout: 0.01)
       }
        
    
    // Cas où on reçoit une réponse incorrect :
    
    /// On ne veut pas d'erreur mais on reçoit une response de mauvaise qualité
    func testGetWeatherShouldPostFailedCallbackIfIncorrectResponse() {
           // Given
            let weatherService = WeatherService(weatherSession: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseKO, error: nil), weatherNYSession: URLSessionFake(data: nil, response: nil, error: nil))
               
           // When
           let expectation = XCTestExpectation(description: "Wait for queue change")
           weatherService.getWeather { (success, weatherDetails) in
                   // Then
                   XCTAssertFalse(success)
                   XCTAssertNil(weatherDetails)
                   /// l'expectation est terminé
                   expectation.fulfill()
           }
               
               /// le micro délais 0.01 ne va pas ralentir nos tests.
               wait(for: [expectation], timeout: 0.01)
       }
    
    // Cas où on a des données incorrectes :
    
    func testGetWeatherShouldPostFailedCallbackIfIncorrectData() {
       // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOK, error: nil), weatherNYSession: URLSessionFake(data: nil, response: nil, error: nil))
               
           // When
           let expectation = XCTestExpectation(description: "Wait for queue change")
           weatherService.getWeather { (success, weatherDetails) in
                   // Then
                   XCTAssertFalse(success)
                   XCTAssertNil(weatherDetails)
                   /// l'expectation est terminé
                   expectation.fulfill()
           }
               
               /// le micro délais 0.01 ne va pas ralentir nos tests.
               wait(for: [expectation], timeout: 0.01)
       }
    
    /// On envoit un callback d'erreur. En cas d'erreur on s'arrête tout de suite.
    func testGetWeatherShouldPostFailedCallbackNYWeatherError() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseOK, error: nil), weatherNYSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        
        // When
        /// On a un micro décalage car on n'est pas dans la même queue donc on fait une expectation. Les expectation servent à attendre.
        let expectation = XCTestExpectation(description: "Wait for queue change")
        
        weatherService.getWeather { (success, weatherDetails) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(weatherDetails)
            /// l'expectation est terminé
            expectation.fulfill()
        }
        
        /// le micro délais 0.01 ne va pas ralentir nos tests.
        wait(for: [expectation], timeout: 0.01)
    }
    
    // MARK: - Cas où le callback d'erreur est bien envoyé
    
    // Cas où il n'y a pas de donnée :
    
    func testGetWeatherShouldPostFailedCallbackIfNYWeatherNoData() {
           // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseOK, error: nil), weatherNYSession: URLSessionFake(data: nil, response: nil, error: nil))
               
           // When
           let expectation = XCTestExpectation(description: "Wait for queue change")
           weatherService.getWeather { (success, weatherDetails) in
                   // Then
                   XCTAssertFalse(success)
                   XCTAssertNil(weatherDetails)
                   /// l'expectation est terminé
                   expectation.fulfill()
           }
               
               /// le micro délais 0.01 ne va pas ralentir nos tests.
               wait(for: [expectation], timeout: 0.01)
       }
        
    
    // Cas où on reçoit une réponse incorrect :
    
    /// On ne veut pas d'erreur mais on reçoit une response de mauvaise qualité
    func testGetWeatherShouldPostFailedCallbackIfNYWeatherIncorrectResponse() {
           // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseOK, error: nil), weatherNYSession: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseKO, error: nil))
               
           // When
           let expectation = XCTestExpectation(description: "Wait for queue change")
           weatherService.getWeather { (success, weatherDetails) in
                   // Then
                   XCTAssertFalse(success)
                   XCTAssertNil(weatherDetails)
                   /// l'expectation est terminé
                   expectation.fulfill()
           }
               
               /// le micro délais 0.01 ne va pas ralentir nos tests.
               wait(for: [expectation], timeout: 0.01)
       }
    
    // Cas où on a des données incorrectes :
    
    func testGetWeatherShouldPostFailedCallbackIfNYWeatherIncorrectData() {
       // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseOK, error: nil), weatherNYSession: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOK, error: nil))
               
       // When
       let expectation = XCTestExpectation(description: "Wait for queue change")
       weatherService.getWeather { (success, weatherDetails) in
                   // Then
                   XCTAssertFalse(success)
                   XCTAssertNil(weatherDetails)
                   /// l'expectation est terminé
                   expectation.fulfill()
       }
               
               /// le micro délais 0.01 ne va pas ralentir nos tests.
               wait(for: [expectation], timeout: 0.01)
   }


    // Cas où tout va bien :
    
    func testGetWeatherShouldPostFailedCallbackIfWeatherLocalAndNYWeatherNoErrorAndCorrectData() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseOK, error: nil), weatherNYSession: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseOK, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        weatherService.getWeather { (success, weatherDetails) in
            // Then
            XCTAssertTrue(success)
            XCTAssertNotNil(weatherDetails)
            
            let nanterreName = "Nanterre"
            let nanterreTemp = 19.06
            
            XCTAssertEqual(nanterreName, weatherDetails!["localCity"]!.name)
            XCTAssertEqual(nanterreTemp, weatherDetails!["localCity"]!.main.temp)
         
            
        
            
            expectation.fulfill()
        }
              
            wait(for: [expectation], timeout: 0.01)
        }
        
    
    
}
