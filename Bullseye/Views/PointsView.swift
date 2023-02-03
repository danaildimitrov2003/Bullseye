//
//  PointsView.swift
//  Bullseye
//
//  Created by Danail Dimitrov on 3.02.23.
//

import SwiftUI

struct PointsView: View {
    var body: some View {
        VStack{
            InstructionText(text: "The slider's value is")
            BigNumberText(text: "89")
            BodyText(text: "You scored 200 points\n 🎉🎉🎉")
            Button(action:{}) {
                ButtonText(text: "Start New Round")
            }
            
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(21.0)
            .shadow(radius: 10, x: 5, y: 5)
        
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView()
        PointsView()
            .preferredColorScheme(.dark)
    }
}
