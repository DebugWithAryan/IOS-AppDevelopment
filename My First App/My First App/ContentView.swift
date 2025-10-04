//
//  ContentView.swift
//  My First App
//
//  Created by Aryan Jaiswal on 04/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Color(.systemMint)
                .ignoresSafeArea()
            
            VStack(alignment: .leading,spacing: 20.0){
                Image("niagarafalls")
                    .resizable()
                    .cornerRadius(15)
                    .aspectRatio(contentMode: .fit)
                
                HStack{
                    Text("Niagara Falls")
                        .font(Font.title)
                        .fontWeight(Font.Weight.bold)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    VStack{
                        //SF symbols
                        HStack{
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.leadinghalf.filled")
                            
                        }
                        .foregroundColor(.orange)
                        .font(.caption)
                        
                        Text("(Reviews 361)")
                            .font(.caption)
                    }

                }
                
                Text("Come visit the falls for an experience you won't forget!")
                
                HStack{
                    Spacer()
                    Image(systemName: "binoculars.fill")
                    Image(systemName: "fork.knife")
                }
                .foregroundColor(.gray)
                .font(Font.caption)
            }
            .padding()
            .background(Rectangle().foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius:15)
            )
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
