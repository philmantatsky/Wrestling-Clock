//
//  ContentView.swift
//  Wrestling Clock
//
//  Created by Phillip Mantatsky on 11/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var wrestler1 = ""
    @State private var wrestler2 = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Who's wrestling?")
                    .font(.title)
                
                TextField("Wrestler #1", text: $wrestler1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                
                Text("Vs.")
                    .bold()
                    .font(.title)
                
                TextField("Wrestler #2", text: $wrestler2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink("Next", destination: SwiftUIView1(wrestler1: wrestler1, wrestler2: wrestler2))
            }
            .navigationTitle("Login")
        }
    }
}

struct wrestlers {
    var Wrestler1 = ""
    var Wrestler2 = ""
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
