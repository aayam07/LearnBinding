//
//  ContentView.swift
//  LearnBinding
//
//  Created by Aayam Adhikari on 04/02/2025.
//

import SwiftUI
import Observation  // Needed to implement new style of global state variable

// Binding is always passed from the parent view to the child view
// That means, a @Binding variable is always created in the child view. The parent view passes one of its variables to the child view as a binding so that the communication is possible between them.


// Environment Object is basically a global state variable


//// Pre iOS 17
//class AppState: ObservableObject {
//    @Published var isOn: Bool = false
//}

// Post iOS 17
@Observable
class AppState {
    
    // all the assigned properties are automatically published. So, no need to wrap with @Published and it is available globally
    var isOn: Bool = false
}


// child view
struct LightBulbView: View {
    
    @Environment(AppState.self) private var appState: AppState
    
    var body: some View {
        
        @Bindable var appState = appState
        
        VStack {
            Image(systemName: appState.isOn ? "lightbulb.fill" : "lightbulb")
                .font(.largeTitle)
                .foregroundStyle(appState.isOn ? .yellow : .black)
            
            Toggle("IsOn", isOn: $appState.isOn)
            
//            Button("Toggle") {
//                appState.isOn.toggle()
//            }
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
    
    @Environment(AppState.self) var appState: AppState
    
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
        .environment(AppState())
}
