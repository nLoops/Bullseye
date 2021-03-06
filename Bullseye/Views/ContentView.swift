//
//  ContentView.swift
//  Bullseye
//
//  Created by Ahmed Ibrahim on 02/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State
    private var isAlertVisible = false
    
    @State
    private var sliderValue = 50.0
    
    @State
    private var game = Game()
    
    
    var body: some View {
        ZStack {
            // rgb(243, 248, 253)
            // Value from 0 to 1 to calculate the color
            // will be 243.0 / 255.0
            // or we could add it to Assets Catalog for global useage
            //            Color("BackgroundColor")
            //                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            BackgroundView(game: $game)
            VStack {
                let padding = isAlertVisible ? 0 : 100
                
                InstructionsView(game: $game)
                    .padding(.bottom,CGFloat(padding))
                if(isAlertVisible){
                    PointsView(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }else{
                    HitMeButton(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
            if !isAlertVisible{
                SliderView(sliderValue: $sliderValue).transition(.scale)
            }
        }
    }
}

struct InstructionsView:View {
    @Binding var game:Game
    
    var body: some View{
        VStack{
            InstructionText(text: "🎯🎯🎯 \nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .padding(.leading,30.0)
                .padding(.trailing,30.0)
            
            BigNumberText(text: String(game.target))
        }
    }
}


struct SliderView : View{
    @Binding var sliderValue : Double
    
    var body: some View{
        HStack {
            Text("1")
                .bold()
                .foregroundColor(Color("TextColor"))
                .frame(width: 35.0)
            Slider(value: self.$sliderValue,in: 1.0...100.0)
            Text("100")
                .bold()
                .foregroundColor(Color("TextColor"))
                .frame(width: 35.0)
        }.padding()
    }
    
}

struct HitMeButton:View {
    @Binding var isAlertVisible:Bool
    @Binding var sliderValue:Double
    @Binding var game:Game
    
    var body: some View{
        Button(action: {
            withAnimation{
                self.isAlertVisible = true
            }
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(RoundedRectangle(
                    cornerRadius:Constants.General.roundRectCornerRadius)
                    .strokeBorder(Color.white,lineWidth: Constants.General.strokeWidth))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        // For Light Mode View
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568
                                  , height: 320))
        
        // For Dark Mode View
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568
                                  , height: 320))
    }
}
