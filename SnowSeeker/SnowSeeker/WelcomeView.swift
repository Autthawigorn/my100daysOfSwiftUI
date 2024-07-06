//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Autthawigorn Yortpiboot on 1/7/2567 BE.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)

            Text("Please select a resort from the left-hand menu; swipe from the left edge to show it.")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
