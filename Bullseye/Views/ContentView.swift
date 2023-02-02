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
            Color("BackgroundColor")
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                    Text("🎯🎯🎯\nPut the Bullseye as close as you can to" .uppercased())
                        .bold()
                        .kerning(2.0)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4.0)
                        .font(.footnote)
                    Text(String(game.target))
                        .kerning(-1.0)
                        .fontWeight(.black)
                        .font(.largeTitle)
                    HStack {
                        Text("1")
                            .font(.body)
                            .bold()
                        Slider(value: $sliderValue, in: 1.0...100.0)
                        
                        Text("100")
                            .font(.body)
                            .bold()
                    }
                    .padding()
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
                    .alert("Hello there!", isPresented: $alertIsVisable) {
                      Button("Awesome!") { }
                    } message: {
                        let roundedValue = Int(sliderValue.rounded())
                        Text("The slider value is \(roundedValue).\n" + "You scored \(game.points(sliderValue:roundedValue)) points this round.")
                    }
 
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //ContentView()
            //.previewLayout(.fixed(width: 568, height: 320))
         
    }
}
