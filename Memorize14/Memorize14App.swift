//
//  Memorize14App.swift
//  Memorize14
//
//  Created by Tanveer Bashir on 7/19/20.
//

import SwiftUI

@main
struct Memorize14App: App {
    let game =  MemoryGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
