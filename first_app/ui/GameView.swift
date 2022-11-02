//
//  ContentView.swift
//  first_app
//
//  Created by alexandre meddas on 19/10/2022.
//

import SwiftUI

struct GameView: View {
    @State var score = 0
    @State var gameIsInProgress = false
    @AppStorage("clickerNickname") var nickname = ""
    @StateObject var gameManager: GameManager = GameManager()
    var isOnFire: Bool {
        guard let bestScore = gameManager.bestGame?.score else { return false }
        return score > bestScore
    }
    
    var body: some View {
        VStack {
            EditableTextView(title: "Pseudo", editedText: $nickname)
            HStack {
                if isOnFire {
                    Image(systemName: "flame")
                }
                Text("Score : \(score)")
                    .font(.title)
                    .padding()
            }
            if nickname.count == 0 {
                Text("Veuillez entrer un pseudo !")
            }
            if gameIsInProgress == true {
                Image(systemName: "plus.square")
                    .font(.title)
                    .onTapGesture {
                        userTouchedClickButton()
                    }
            }
            HStack {
                Image(systemName: "star")
                Text("Hall of fame")
                    .font(.title2)
                    .padding()
                Image(systemName: "star")
            }
            GameResultListView(resultList: gameManager.resultList)
            Spacer()
            if gameIsInProgress == false && nickname.count > 0 {
                Button("Nouvelle partie") {
                    userTouchedStartButton()
                }.padding()
            }
        }
        .padding()
    }
    
    func userTouchedStartButton() {
        score = 0
        gameIsInProgress = true
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { _ in
            gameDidFinish()
        }
    }
    
    func userTouchedClickButton() {
        if gameIsInProgress {
            score += 1
        }
    }
    
    func gameDidFinish() {
        gameIsInProgress = false
        gameManager.gameDidFinish(username: nickname, score: score)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
