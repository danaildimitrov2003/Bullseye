//
//  PointsView.swift
//  Bullseye
//
//  Created by Danail Dimitrov on 3.02.23.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var alertIsVisable: Bool
    @Binding var sliderValue: Double
    @Binding var game:Game
    
    var body: some View {
        let roundedValue =  Int(sliderValue.rounded())
        let points =  game.points(sliderValue: roundedValue)
        VStack{
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) Points\n 🎉🎉🎉")
            Button(action:{
                withAnimation{
                    alertIsVisable = false
                }
                game.startNewRound(points: points)
            }) {
                ButtonText(text: "Start New Round")
            }
            
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundRectCorerRadius)
            .shadow(radius: 10, x: 5, y: 5)
            .transition(.scale)
        
    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private var alertIsVisable = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var  game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(alertIsVisable: alertIsVisable, sliderValue: sliderValue, game: game)
        PointsView(alertIsVisable: alertIsVisable, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
    }
}
