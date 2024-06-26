//
//  AstronautView.swift
//  Moonshot
//
//  Created by Autthawigorn Yortpiboot on 20/4/2567 BE.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronauts["armstrong"]!)
        .preferredColorScheme(.dark)
}

//struct AstronautView_Previews: PreviewProvider {
//    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//    
//    static var previews: some View {
//        AstronautView(astronaut: astronauts["armstrong"]!)
//            .preferredColorScheme(.dark)
//    }
//}
