//
//  Game.swift
//  Bullseye
//
//  Created by Danail Dimitrov on 2.02.23.
//

import Foundation

struct Game{
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        100 - abs(sliderValue - target)
    }
}
