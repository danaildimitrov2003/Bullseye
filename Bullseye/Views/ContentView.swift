//
//  ContentView.swift
//  Bullseye
//
//  Created by Danail Dimitrov on 1.02.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisable = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, 100)
                HitMeButton(alertIsVisable: $alertIsVisable, sliderValue: $sliderValue, game: $game)
            }
            SliderView(sliderValue: $sliderValue)
        }
        
    }
}
struct InstructionsView: View {
    
    @Binding var game:Game
    var body: some View{
        VStack{
            InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}
struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View{
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}
struct HitMeButton: View {
    @Binding var alertIsVisable: Bool
    @Binding var sliderValue: Double
    @Binding var game:Game
    
    var body: some View{
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue:roundedValue)
        Button(action: {
            alertIsVisable = true
        }) {
            Text("Hit me".uppercased())
            .bold()
            .font(.title3)
        }
        .foregroundColor(Color.white)
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
        .alert("Hello there!", isPresented: $alertIsVisable) {
        Button("Awesome!") {
                            game.startNewRound(points: points)
        }
        } message: {
            
            Text("The slider value is \(roundedValue).\n" + "You scored \(points) points this round.")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
        //ContentView()
            //.previewLayout(.fixed(width: 568, height: 320))
         
    }
}
