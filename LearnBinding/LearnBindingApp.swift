//
//  LearnBindingApp.swift
//  LearnBinding
//
//  Created by Aayam Adhikari on 04/02/2025.
//

import SwiftUI

@main
struct LearnBindingApp: App {
    
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
