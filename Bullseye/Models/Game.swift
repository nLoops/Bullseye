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
        let diff = abs(target - sliderValue)
        let bouns:Int
        
        if diff == 0 {
            bouns = 100
        } else if diff <= 2 {
            bouns = 50
        }else{
            bouns = 0
        }
        
        return 100 - diff + bouns
    }
    
    mutating func startNewRound(points:Int){
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart(){
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
