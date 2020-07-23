//
//  ExchangeServiceTestCase.swift
//  BackpackTests
//
//  Created by Caroline Zaini on 22/07/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation
import XCTest
@testable import Backpack

class ExchangeServiceTestCase: XCTestCase {
    
    // MARK: - Cas où il y a une erreur
    
    /// On envoit un callback d'erreur. En cas d'erreur on s'arrête tout de suite.
    func testGetExchangeShouldPostFailedCallbackError() {
        // Given
        let exchangeService = ExchangeService(exchangeSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        // When
        /// On a un micro décalage car on n'est pas dans la même queue donc on fait une expectation. Les expectation servent à attendre.
        let expectation = XCTestExpectation(description: "Wait for queue change")
        exchangeService.getExchange { (success, exchange) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(exchange)
            /// l'expectation est terminé
            expectation.fulfill()
        }
        /// le micro délais 0.01 ne va pas ralentir nos tests.
        wait(for: [expectation], timeout: 0.01)
    }
    
    // MARK: - Cas où le callback d'erreur est bien envoyé
    
    // Cas où il n'y a pas de donnée :
    
    func testGetExchangeShouldPostFailedCallbackIfNoData() {
           // Given
           let exchangeService = ExchangeService(exchangeSession: URLSessionFake(data: nil, response: nil, error: nil))
           // When
           let expectation = XCTestExpectation(description: "Wait for queue change")
           exchangeService.getExchange { (success, exchange) in
               // Then
               XCTAssertFalse(success)
               XCTAssertNil(exchange)
               expectation.fulfill()
           }
           wait(for: [expectation], timeout: 0.01)
       }
    
    // Cas où on reçoit une réponse incorrect :
    
    /// On ne veut pas d'erreur mais on reçoit une response de mauvaise qualité
    func testGetExchangeShouldPostFailedCallbackIfIncorrectResponse() {
           // Given
        let exchangeService = ExchangeService(exchangeSession: URLSessionFake(data: FakeResponseData.exchangeCorrectData, response: FakeResponseData.responseKO, error: nil))
           // When
           let expectation = XCTestExpectation(description: "Wait for queue change")
           exchangeService.getExchange { (success, exchange) in
               // Then
               XCTAssertFalse(success)
               XCTAssertNil(exchange)
               expectation.fulfill()
           }
           wait(for: [expectation], timeout: 0.01)
       }
    
    // Cas où on a des données incorrectes :
    
    func testGetExchangeShouldPostFailedCallbackIfIncorrectData() {
       // Given
        let exchangeService = ExchangeService(exchangeSession: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOK, error: nil))
           // When
           let expectation = XCTestExpectation(description: "Wait for queue change")
           exchangeService.getExchange { (success, exchange) in
               // Then
               XCTAssertFalse(success)
               XCTAssertNil(exchange)
               expectation.fulfill()
           }
           wait(for: [expectation], timeout: 0.01)
       }
    
    // Cas où tout va bien :
    
    func testGetExchangeShouldPostFailedCallbackIfNoErrorAndCorrectData() {
    // Given
        let exchangeService = ExchangeService(exchangeSession: URLSessionFake(data: FakeResponseData.exchangeCorrectData, response: FakeResponseData.responseOK, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        exchangeService.getExchange { (success, exchange) in
            // Then
            XCTAssertTrue(success)
            XCTAssertNotNil(exchange)
            
            let base = "EUR"
            let date = "2020-07-21"  
            let rates = ["USD":  1.14364]
            
            XCTAssertEqual(base, exchange!.base)
            XCTAssertEqual(date, exchange!.date)
            XCTAssertEqual(rates, exchange!.rates)
            
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
}
