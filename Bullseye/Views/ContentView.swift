//
//  ContentView.swift
//  Bullseye
//
//  Created by Pratyaksh Tyagi on 12/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue:Double = 1.0
    @State private var isVisible:Bool = false
    @State private var game:Game = Game()
    
    var body: some View {
        VStack(alignment: .center){
            Text("🎯 Put the Bullseye as close as you can to !").bold().kerning(1.0).multilineTextAlignment(.center)
                .lineSpacing(4.0).font(.footnote)
                .padding()
            Text(String(game.target)).fontWeight(.black).font(.largeTitle).kerning(-1.0)
            
            HStack{
                Text("1").bold().font(.body)
                Slider(value: self.$sliderValue, in:1.0...100.0).accentColor(.red)
                Text("100").bold().font(.body)
            }
            
            Button(action:{
                self.isVisible = true
                let currentScore = game.calculateScore(num: Int(sliderValue.rounded()))
                game.score += currentScore
                game.round += 1
                
            }) {
                Text("Hit Me!")
            }.padding()
                .alert(isPresented: $isVisible){
                    let roundedValue = Int(sliderValue.rounded())
                    
                    return Alert(title: Text("This is an Alert"), message: Text("The value you got is: \(roundedValue) \n" + "You Scored: \(game.calculateScore(num:roundedValue))"), dismissButton: .default(Text("Gotcha!"), action: {
                        game.target = Int.random(in: 1...100)
                    }))
                }
            
            Text("Your Score: \(game.score)")
            Text("Current Round: \(game.round)")

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
        
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
