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
    
    
    func testNewRound(){
        // GIVEN --> new instance of Game()
        // WHEN --> start a new game round
        game.startNewRound(points:100)
        
        // THEN
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    
    func testScoreExact(){
        // GIVEN
        let guess = game.target
        
        // WHEN
        let score = game.points(sliderValue: guess)
        
        // THEN
        XCTAssertEqual(score, 200)
    }
    
    
    func testScoreClose(){
        // GIVEN
        let guess = game.target + 2
        
        // WHEN
        let score = game.points(sliderValue: guess)
        
        // THEN
        XCTAssertEqual(score, 98 + 50)
    }
    
    
    func testRestart (){
        // GIVEN
        game.startNewRound(points:100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        
        // WHEN
        game.restart()
        
        // THEN
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
      
        
    }
    
    
    func testLeaderboard(){
        // GIVEN and WHEN starting a new round
        game.startNewRound(points: 100)
        
        // THEN
        XCTAssertEqual(game.leaderboardArray.count, 1)
        XCTAssertEqual(game.leaderboardArray[0].score, 100)
        
        // GIVEN and WHEN starting a new round
        game.startNewRound(points: 200)
        
        // THEN
        XCTAssertEqual(game.leaderboardArray.count, 2)
        XCTAssertEqual(game.leaderboardArray[0].score, 200)
        XCTAssertEqual(game.leaderboardArray[1].score, 100)
        
    }
    
    
}
