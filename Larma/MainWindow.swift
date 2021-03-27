//
//  ContentView.swift
//  Larma
//
//  Created by Johannes Sörensen on 2021-03-27.
//

import SwiftUI

struct MainWindow: View {
    @State private var duration: String = ""
    
    var body: some View {
        VStack {
            
            TextField("Minutes", text: $duration, onCommit: {
                print(duration)
                duration = ""
            })
            .disableAutocorrection(true)
            
            Button("Quit", action: { NSApplication.shared.terminate(self) })
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainWindow()
    }
}
