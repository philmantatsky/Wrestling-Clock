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
                    Spacer().frame(height: 20)
                    Text("Who's wrestling?")
                        .font(.custom("Times New Roman", size: 35))
                    
                    TextField("Wrestler #1", text: $wrestler1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                        .font(.title)
                    
                    Text("Vs.")
                        .bold()
                        .font(.title2)
                    
                    TextField("Wrestler #2", text: $wrestler2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                        .font(.title)
                    Spacer()
                    
                    NavigationLink("Next", destination: SwiftUIView1(wrestler1: wrestler1, wrestler2: wrestler2))
                }
            }
            .navigationBarTitle("Login", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .padding()
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
