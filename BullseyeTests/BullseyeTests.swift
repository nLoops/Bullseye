//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Ahmed Ibrahim on 02/04/2021.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {

    var game:Game!
    
    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    
    func testScorePositive(){
        // GIVEN
        let guess = game.target + 5
        
        // WHEN
        let score = game.points(sliderValue: guess)
        
        // THEN
        XCTAssertEqual(score, 95)
    }
    
    
    func testScoreNegative(){
        // GIVEN
        let guess = game.target - 5
        
        // WHEN
        let score = game.points(sliderValue: guess)
        
        // THEN
        XCTAssertEqual(score, 95)
    }
    
}
