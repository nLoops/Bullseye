//
//  DefaultTest.swift
//  BullseyeTests
//
//  Created by Ahmed Ibrahim on 09/04/2021.
//

import XCTest
@testable import Bullseye

class DefaultTest: XCTestCase {

    var game:Game!
    
    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

}
