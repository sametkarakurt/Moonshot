//
//  CrewHorizontal.swift
//  Moonshot
//
//  Created by Samet Karakurt on 16.02.2022.
//

import SwiftUI

struct CrewHorizontal: View {
    
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(crew, id: \.role){ crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1))
                            
                            VStack(alignment: .leading){
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            
        }
    }
}

struct CrewHorizontal_Previews: PreviewProvider {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    static var previews: some View {
        CrewHorizontal(crew: [])
    }
}
