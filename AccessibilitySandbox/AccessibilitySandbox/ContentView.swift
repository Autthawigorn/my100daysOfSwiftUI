//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Autthawigorn Yortpiboot on 11/6/2567 BE.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
            "ales-krivec-15949",
            "galina-n-189483",
            "kevin-horstmann-141705",
            "nicolas-tissot-335096"
        ]

        @State private var selectedPicture = Int.random(in: 0...3)

        var body: some View {
            Image(pictures[selectedPicture])
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    selectedPicture = Int.random(in: 0...3)
                }
        }
}

#Preview {
    ContentView()
}
