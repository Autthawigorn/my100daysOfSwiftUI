//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Autthawigorn Yortpiboot on 20/4/2567 BE.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDivider()
}
