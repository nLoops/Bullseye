//
//  Game.swift
//  Bullseye
//
//  Created by Ahmed Ibrahim on 03/04/2021.
//

import Foundation

struct Game{
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue:Int) -> Int {
//        let diff = abs(target - sliderValue)
        var difference : Int

        if sliderValue > self.target {
            difference = sliderValue - self.target
        }else if self.target > sliderValue{
            difference = self.target - sliderValue
        }else{
            difference = 0
        }
        return 100 - difference
    }
}
