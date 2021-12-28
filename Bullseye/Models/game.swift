//
//  game.swift
//  Bullseye
//
//  Created by Pratyaksh Tyagi on 12/27/21.
//

import Foundation

struct Game{
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func calculateScore(num:Int) -> Int {
        print("Calculating Score")
        return 100 - abs(target - num)
    }
}
