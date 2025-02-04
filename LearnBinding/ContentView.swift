//
//  ContentView.swift
//  LearnBinding
//
//  Created by Aayam Adhikari on 04/02/2025.
//

import SwiftUI

// Binding is always passed from the parent view to the child view
// That means, a @Binding variable is always created in the child view. The parent view passes one of its variables to the child view as a binding so that the communication is possible between them.


// child view
struct LightBulbView: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        VStack {
            Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
                .font(.largeTitle)
                .foregroundStyle(isOn ? .yellow : .black)
            
            Button("Toggle") {
                isOn.toggle()
            }
        }
    }
}


// parent view: as it uses the child view
struct ContentView: View {
    
    @State private var isLightOn: Bool = false
    
    var body: some View {
        VStack {
            LightBulbView(isOn: $isLightOn)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(isLightOn ? .gray : .green)
    }
}

#Preview {
    ContentView()
}
