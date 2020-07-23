//
//  TranslateServiceTestCase.swift
//  BackpackTests
//
//  Created by Caroline Zaini on 22/07/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import Foundation
import XCTest
@testable import Backpack

class TranslateServiceTestCase: XCTestCase {
    
        // MARK: - Cas où il y a une erreur
        
        /// On envoit un callback d'erreur. En cas d'erreur on s'arrête tout de suite.
        func testGetTranslateShouldPostFailedCallbackError() {
            // Given
            let translateService = TranslateService(translateSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))

            // When
            /// On a un micro décalage car on n'est pas dans la même queue donc on fait une expectation. Les expectation servent à attendre.
            let expectation = XCTestExpectation(description: "Wait for queue change")
            translateService.getTranslate(text: "Bonjour") { (success, translate) in
                // Then
                XCTAssertFalse(success)
                XCTAssertNil(translate)
                /// l'expectation est terminé
                expectation.fulfill()
            }
            /// le micro délais 0.01 ne va pas ralentir nos tests.
            wait(for: [expectation], timeout: 0.01)

            }
            
        
        
        // MARK: - Cas où le callback d'erreur est bien envoyé
        
        // Cas où il n'y a pas de donnée :
        
        func testGetTranslateShouldPostFailedCallbackIfNoData() {
            
            // Given
            let translateService = TranslateService(translateSession: URLSessionFake(data: nil, response: nil, error: nil))

            // When
            /// On a un micro décalage car on n'est pas dans la même queue donc on fait une expectation. Les expectation servent à attendre.
            let expectation = XCTestExpectation(description: "Wait for queue change")
            translateService.getTranslate(text: "Bonjour") { (success, translate) in
                // Then
                XCTAssertFalse(success)
                XCTAssertNil(translate)
                /// l'expectation est terminé
                expectation.fulfill()
            }
            /// le micro délais 0.01 ne va pas ralentir nos tests.
            wait(for: [expectation], timeout: 0.01)

        }
        
        // Cas où on reçoit une réponse incorrect :
        
        /// On ne veut pas d'erreur mais on reçoit une response de mauvaise qualité
        func testGetTranslateShouldPostFailedCallbackIfIncorrectResponse() {
            
            // Given
            let translateService = TranslateService(translateSession: URLSessionFake(data: FakeResponseData.translateCorrectData, response: FakeResponseData.responseKO, error: nil))

            // When
            /// On a un micro décalage car on n'est pas dans la même queue donc on fait une expectation. Les expectation servent à attendre.
            let expectation = XCTestExpectation(description: "Wait for queue change")
            translateService.getTranslate(text: "Bonjour") { (success, translate) in
                // Then
                XCTAssertFalse(success)
                XCTAssertNil(translate)
                /// l'expectation est terminé
                expectation.fulfill()
            }
            /// le micro délais 0.01 ne va pas ralentir nos tests.
            wait(for: [expectation], timeout: 0.01)
        }
        
        // Cas où on a des données incorrectes :
        
        func testGetTranslateShouldPostFailedCallbackIfIncorrectData() {
            
            // Given
            let translateService = TranslateService(translateSession: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOK, error: nil))

            // When
            /// On a un micro décalage car on n'est pas dans la même queue donc on fait une expectation. Les expectation servent à attendre.
            let expectation = XCTestExpectation(description: "Wait for queue change")
            translateService.getTranslate(text: "Bonjour") { (success, translate) in
                // Then
                XCTAssertFalse(success)
                XCTAssertNil(translate)
                /// l'expectation est terminé
                expectation.fulfill()
            }
            /// le micro délais 0.01 ne va pas ralentir nos tests.
            wait(for: [expectation], timeout: 0.01)
        }
        
        // Cas où tout va bien :
        
        func testGetTranslateShouldPostFailedCallbackIfNoErrorAndCorrectData() {
            
            // Given
            let translateService = TranslateService(translateSession: URLSessionFake(data: FakeResponseData.translateCorrectData, response: FakeResponseData.responseOK, error: nil))

            // When
            /// On a un micro décalage car on n'est pas dans la même queue donc on fait une expectation. Les expectation servent à attendre.
            let expectation = XCTestExpectation(description: "Wait for queue change")
            translateService.getTranslate(text: "Bonjour") { (success, translate) in
                // Then
                XCTAssertTrue(success)
                XCTAssertNotNil(translate)
                
                let translatedText = "Hello"
                
            
                
                /// l'expectation est terminé
                expectation.fulfill()
            }
            /// le micro délais 0.01 ne va pas ralentir nos tests.
            wait(for: [expectation], timeout: 0.01)
        }
           
           

    
}
