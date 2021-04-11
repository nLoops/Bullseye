//
//  PointsView.swift
//  Bullseye
//
//  Created by Ahmed Ibrahim on 10/04/2021.
//

import SwiftUI

struct PointsView: View {
    @Binding var isAlertVisible:Bool
    @Binding var sliderValue:Double
    @Binding var game:Game
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing:10){
            InstructionText(text: "The Slider's Value is".uppercased())
            BigNumberText(text: String(roundedValue))
            BodyText(label: "You scored \(points) Points\n 🎉🎉🎉")
            Button(action: {
                withAnimation{
                    isAlertVisible = false
                }
                game.startNewRound(points: points)
            }, label: {
                ButtonText(label: "Start New Round")
            })
        }
        .padding()
        .frame(maxWidth:300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21.0)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,x:5,y:5 )
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        // For Light Mode View
        PointsView(isAlertVisible: alertIsVisible, sliderValue: sliderValue, game: game)
        PointsView(isAlertVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568
                                  , height: 320))
        
        // For Dark Mode View
        PointsView(isAlertVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
        PointsView(isAlertVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568
                                  , height: 320))
    }
}
