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

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            LabelTextView(label: "round")
        }
    }
}
