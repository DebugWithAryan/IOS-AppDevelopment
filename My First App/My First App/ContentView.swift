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
            Color(.black)
                .ignoresSafeArea()
            
            VStack{
                Image("niagarafalls")
                    .resizable()
                    .cornerRadius(15)
                    .aspectRatio(contentMode: .fit)
                    .padding(.all)
                
                Text("Niagara Falls")
                    .font(Font.largeTitle)
                    .fontWeight(Font.Weight.bold)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ContentView()
}
