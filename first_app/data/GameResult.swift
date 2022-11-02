//
//  GameResultView.swift
//  first_app
//
//  Created by alexandre meddas on 31/10/2022.
//

import SwiftUI

struct GameResult : Identifiable {
    let id: UUID = UUID()
    let playerName: String
    let score: Int
}
