//
//  ContentView.swift
//  Larma
//
//  Created by Johannes Sörensen on 2021-03-27.
//

import SwiftUI

struct ContentView: View {
    @State private var textField:String = ""

    var body: some View {
        VStack {
            Button("Click me!", action: {
                print("clicked!")
            })

            TextField("Enter something", text: $textField, onCommit: {
                print("text field committed! value: \(textField)")
            })

            Menu {
                Text("Item 1")
                Text("Item 2")
            } label: {
                Text("Menu doesn't work")
            }

            Button("Quit", action: {
                NSApplication.shared.terminate(self)
            })
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
