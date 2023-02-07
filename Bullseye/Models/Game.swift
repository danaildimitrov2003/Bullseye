//
//  Game.swift
//  Bullseye
//
//  Created by Danail Dimitrov on 2.02.23.
//

import Foundation

struct LeaderboardEntry{
    let score: Int
    let date: Date
}

struct Game{
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false){
        if loadTestData{
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 70, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 60, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
        }
    }
    func points(sliderValue: Int) -> Int {
        let diffrence = abs(sliderValue - target)
        let bonus: Int
        if diffrence == 0 {
            bonus = 100
        }else if diffrence <= 2 {
            bonus = 50
        }else{
            bonus = 0
        }
        return 100 - diffrence + bonus
    }
    mutating func addToLeaderboard(point: Int){
        leaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
        leaderboardEntries.sort{$0.score > $1.score}
    }
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(point: points)
    }
    mutating func restart(){
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    
}
