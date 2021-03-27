//
//  ContentView.swift
//  Larma
//
//  Created by Johannes Sörensen on 2021-03-27.
//

import SwiftUI
import AppKit

struct MainWindow: View {
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            
            TextField("Alarm...", text: $username, onEditingChanged: { (changed) in
                print("Username onEditingChanged - \(changed)")
            }) {
                print("Username onCommit")
            }
            .disableAutocorrection(true)
            
            Button("Quit", action: {
                NSApplication.shared.terminate(self)
            })
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainWindow()
    }
}
