//
//  ContentView.swift
//  Moonshot
//
//  Created by Samet Karakurt on 13.02.2022.
//

import SwiftUI

struct ContentView: View {
    let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    @State var showingGrid = true
   
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        NavigationView{
            Group{
                if showingGrid {
                    ListLayout(astronauts: astronauts, missions: missions)
                        .navigationTitle("Moonshot")
                        .background(.darkBackground)
                        .preferredColorScheme(.dark)
                }else {
                    GridLayout(astronauts: astronauts, missions: missions)
                        .navigationTitle("Moonshot")
                        .background(.darkBackground)
                        .preferredColorScheme(.dark)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showingGrid.toggle()
                    }label: {
                        if showingGrid {
                            Image(systemName: "rectangle.grid.2x2")
                                .foregroundColor(.white)
                        } else {
                            Image(systemName: "list.dash")
                                .foregroundColor(.white)
                        }
                    }


                }
                
            }


        }
        
 


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
