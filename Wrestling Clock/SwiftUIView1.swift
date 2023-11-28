//
//  SwiftUIView1.swift
//  Wrestling Clock
//
//  Created by Phillip Mantatsky on 11/28/23.
//

import SwiftUI

struct SwiftUIView1: View {
    let Wrestlers = wrestlers()
    var body: some View {
        Text("Clock")
    }
}

struct SwiftUIView1_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView1()
    }
}
