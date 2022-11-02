//
//  GameManager.swift
//  first_app
//
//  Created by alexandre meddas on 31/10/2022.
//

import Foundation

class GameManager : ObservableObject {
    @Published var resultList: [GameResult] = []
    var bestGame: GameResult? { resultList.first }
    
    func gameDidFinish(username:String, score: Int) {
        let result = GameResult(playerName: username, score: score)
        resultList.append(result)
        resultList.sort {(result1, result2) -> Bool in
            result1.score > result2.score
        }
    }
}
