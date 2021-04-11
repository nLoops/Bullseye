//
//  TextViews.swift
//  Bullseye
//
//  Created by Ahmed Ibrahim on 05/04/2021.
//

import SwiftUI

struct InstructionText: View {
    
    var text:String
    
    var body: some View {
        Text(text)
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}


struct BigNumberText:View {
    var text:String
    
    var body: some View{
        Text(String(text))
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct LabelTextView:View {
    var label:String
    
    var body: some View{
        Text(label.uppercased())
            .bold()
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .font(.caption)
    }
}

struct BodyText:View {
    var label:String
    
    var body: some View{
        Text(label)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText:View {
    var label:String
    
    var body: some View{
        Text(label)
            .bold()
            .frame(maxWidth:.infinity)
            .padding()
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12.0)
        
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            LabelTextView(label: "round")
            // To show emojis lis hit [ctrl + cmd + space]
            BodyText(label: "You scored 200 Points\n 🎉🎉🎉")
            ButtonText(label: "Start New Round")
        }.padding()
    }
}
