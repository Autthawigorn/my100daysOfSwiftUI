//
//  CrewRoster.swift
//  Moonshot
//
//  Created by Autthawigorn Yortpiboot on 20/4/2567 BE.
//

import SwiftUI

struct CrewRoster: View {
    
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            VStack(alignment: .leading) {
                                
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                                
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}


// Preview
struct CrewRoster_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        let sampleMission = missions[0]
        let sampleCrew: [MissionView.CrewMember] = sampleMission.crew.map { member in
            let astronaut = astronauts[member.name]!
            return MissionView.CrewMember(role: member.role, astronaut: astronaut)
        }
        return CrewRoster(crew: sampleCrew)
            .preferredColorScheme(.dark)
    }
}

