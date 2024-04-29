//
//  MissionView.swift
//  Moonshot
//
//  Created by Autthawigorn Yortpiboot on 18/4/2567 BE.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                    Text("Launch Date: \(mission.formattedLaunchDate)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .padding(.top, 10)
                    
                    VStack(alignment: .leading) {
                        
                        CustomDivider()
                        
                        Text("MIssion Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        CustomDivider()
                        
                        Text("Crew Members")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                            .padding(.bottom, 5)
                        
                    }
                    .padding(.horizontal)
                    
                    CrewRoster(crew: crew)
                }
                .padding(.bottom)
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronaults: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronaults)
        .preferredColorScheme(.dark)
}

//struct MissionView_Previews: PreviewProvider {
//    static let missions: [Mission] = Bundle.main.decode("missions.json")
//    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//    
//    static var previews: some View {
//        MissionView(mission: missions[1], astronauts: astronauts)
//            .preferredColorScheme(.dark)
//    }
//}



