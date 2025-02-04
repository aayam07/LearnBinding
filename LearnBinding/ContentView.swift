//
//  ContentView.swift
//  LearnBinding
//
//  Created by Aayam Adhikari on 04/02/2025.
//

import SwiftUI

// Binding is always passed from the parent view to the child view
// That means, a @Binding variable is always created in the child view. The parent view passes one of its variables to the child view as a binding so that the communication is possible between them.


// Environment Object is basically a global state variable


// Pre iOS 17
class AppState: ObservableObject {
    @Published var isOn: Bool = false
}


// child view
struct LightBulbView: View {
    
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        VStack {
            Image(systemName: appState.isOn ? "lightbulb.fill" : "lightbulb")
                .font(.largeTitle)
                .foregroundStyle(appState.isOn ? .yellow : .black)
            
            Button("Toggle") {
                appState.isOn.toggle()
            }
        }
    }
}


struct LightRoomView: View {
    
    var body: some View {
        LightBulbView()
    }
}


// parent view: as it uses the child view
struct ContentView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            LightRoomView()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(appState.isOn ? .gray : .white)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
}
