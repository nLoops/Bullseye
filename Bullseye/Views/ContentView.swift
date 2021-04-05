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
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("🎯🎯🎯 \nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                    .foregroundColor(Color("TextColor"))
                
                
                Text(String(self.game.target))
                    .kerning(-1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color("TextColor"))
                
                HStack {
                    Text("1")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                    Slider(value: self.$sliderValue,in: 1.0...100.0)
                    Text("100")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                }.padding()
                Button(action: {
                    self.isAlertVisible = true
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
                .cornerRadius(21.0)
                
                .alert(isPresented: $isAlertVisible, content: {
                    let roundedValue = Int(self.sliderValue.rounded())
                    return Alert(title: Text("Hello There!"),message: Text("The slide value is \(self.game.points(sliderValue:roundedValue))."),dismissButton: .default(Text("OK")))
                })
                
            }
        }
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
