//
//  SwiftUIView1.swift
//  Wrestling Clock
//
//  Created by Phillip Mantatsky on 11/28/23.
//

import SwiftUI

struct SwiftUIView1: View {
    @State private var timeMinutes = 2
    @State private var timeSeconds = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var wrestler1: String
    var wrestler2: String

    var body: some View {
        VStack {
            Text("Clock")
                .font(.title)
                .bold()
                .frame(width:100, height: 50)
            Text("\(timeMinutes):\(String(format: "%02d", timeSeconds))")
                .frame(width: 4000, height: 200)
                .font(.custom("Times New Roman", size: 100))
                .onReceive(timer) { _ in
                    if timeSeconds > 0 {
                        timeSeconds -= 1
                    } else if timeMinutes > 0 {
                        timeMinutes -= 1
                        timeSeconds = 59
                    }
                }
            Spacer()
            Spacer()
            HStack {
                Text("Wrestler 1: \(wrestler1)")
                Text("Wrestler 2: \(wrestler2)")
            }
        }
    }
}

struct SwiftUIView1_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView1(wrestler1: "Wrestler 1", wrestler2: "Wrestler 2")
    }
}
