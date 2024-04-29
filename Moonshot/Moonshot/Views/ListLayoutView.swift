//
//  ListLayout.swift
//  Moonshot
//
//  Created by Autthawigorn Yortpiboot on 20/4/2567 BE.
//

import SwiftUI

import SwiftUI

struct ListLayout: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions :[Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        ScrollView{
            LazyVStack {
                ForEach(missions){ mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 66)
                                .padding()
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
                //.padding(.vertical, 4)
            }
            .padding([.horizontal, .bottom])
        }
        .background(.darkBackground)
    }
}

#Preview {
    ListLayout()
}
