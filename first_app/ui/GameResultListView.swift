//
//  ResultListView.swift
//  first_app
//
//  Created by alexandre meddas on 31/10/2022.
//

import SwiftUI

struct GameResultListView: View {
    var resultList: [GameResult]
    var body: some View {
        List(resultList) { (result:GameResult) in
            HStack {
                Text("\(result.playerName) - \(result.score)")
                    .font(.title2)
                    .padding()
            }
        }
        .listStyle(.plain)
    }
}

struct GameResultListView_Previews: PreviewProvider {
    static var previews: some View {
        GameResultListView(resultList: [
            GameResult(playerName: "Test1", score: 1),
            GameResult(playerName: "Test2", score: 2),
            GameResult(playerName: "Test3", score: 3),
            GameResult(playerName: "Test4", score: 4)
        ])
        .previewLayout(.sizeThatFits)
    }
}
