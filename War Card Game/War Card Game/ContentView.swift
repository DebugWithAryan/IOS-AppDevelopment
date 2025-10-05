//
//  ContentView.swift
//  War Card Game
//
//  Created by Aryan Jaiswal on 04/10/25.
//

import SwiftUI

struct ContentView: View {
    
    var playerCard : String = "card7"
    var cpuCard : String = "card8"
    
    var playerScore: Int = 0
    var cpuScore: Int = 0
    
    
    var body: some View {
        
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }

                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom,10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom,10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
                
                
            }
        }
    }
    
    func deal(){
        print("Deal Cards")
    }
}



#Preview {
    ContentView()
}
