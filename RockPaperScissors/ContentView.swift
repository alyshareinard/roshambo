//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Alysha Reinard on 1/22/20.
//  Copyright © 2020 Alysha Reinard. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var wingame = Int.random(in: 0...1)
    @State var objective = ["WIN", "LOSE"]
    @State var compMove = Int.random(in: 0...2)
    @State var possMoves = ["RPS_scissors", "RPS_rock", "RPS_paper"]
    @State var scoreTitle = ""
    @State var score = 0
    
    
    var body: some View {

        VStack{
            Spacer()
            Text("Roshambo brain bender")
            .font(Font.custom("Arial Rounded MT Bold", size:24))

            Spacer()
            
            Text("Computer's move:")
            Image(self.possMoves[compMove])
                // .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("You want to : \(objective[wingame])")
            
            HStack{
                ForEach(0 ..< 3){ move in
                    Button(action: {
                        self.moveTapped(move)
                    }) {
                        Image(self.possMoves[move])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                Spacer()
                
                
            }//Hstack
            Text("\(scoreTitle)")
            Text("Your score is: \(score)")
            Spacer()
            
        }//Vstack

        
    }//body
    func nextMove(){
        wingame = Int.random(in: 0...1)
        compMove = Int.random(in: 0...2)
    }
    func correctMove()->Int{
        if self.wingame == 0 {
            return ((self.compMove + 1) % 3)
        }else{
            return((self.compMove - 1) % 3)
            
        }
        
    }//func correctMove
    
    func moveTapped(_ move:Int){
        if move == correctMove(){
            scoreTitle = "Correct!"
            score+=1
            
        }else{
            scoreTitle = "Wrong!"
        }
        nextMove()
    }//func moveTapped
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
