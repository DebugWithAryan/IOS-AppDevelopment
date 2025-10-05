//
//  ContentView.swift
//  War Card Game
//
//  Created by Aryan Jaiswal on 04/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard : String = "card7"
    @State var cpuCard : String = "card8"
    
    @State var playerScore: Int = 0
    @State var cpuScore: Int = 0
    
    
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
        
        //Randomize the players card
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        
        //Randomize the cpu card
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        //Update the score
        
        if playerCardValue>cpuCardValue
        {
            //Add one to player score
            playerScore += 1
        }
        else if cpuCardValue>playerCardValue
        {
            //Add one to cpu score
            cpuScore += 1
        }

    }
}



#Preview {
    ContentView()
}
