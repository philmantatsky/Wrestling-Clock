//
//  ContentView.swift
//  Wrestling Clock
//
//  Created by Phillip Mantatsky on 11/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var Wrestlers = wrestlers()
    var body: some View {
        NavigationView {
            VStack {
                Text("Who's wrestling?")
                    .font(.title)
                    CustomTextField(placeholder: "Wrestler #1", bindingText: $Wrestlers.Wrestler1)
                        .multilineTextAlignment(.center)
                Text("Vs.")
                    .bold()
                    .font(.title)
                CustomTextField(placeholder: "Wrestler #2", bindingText: $Wrestlers.Wrestler2)
                    .multilineTextAlignment(.center)
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

struct CustomTextField: View {
    let placeholder: String
    let bindingText: Binding<String>
    
    var body: some View {
        TextField(placeholder, text: bindingText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
    }
}
