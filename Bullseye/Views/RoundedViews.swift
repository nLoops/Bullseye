//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Ahmed Ibrahim on 07/04/2021.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    
    var systemName:String
    
    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0 )
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"),
                                  lineWidth: 2.0)
            )
    }
}

struct RoundedImageViewFilled: View {
    
    var systemName:String
    
    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56.0, height: 56.0 )
            .background(Circle()
                            .fill(Color("ButtonFilledBackgroundColor")))
        
    }
}

struct RoundRectTextView : View {
    var text:String
    
    var body: some View{
        Text(text)
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .kerning(-0.2)
            .frame(width: 68.0,height: 56.0)
            .background(RoundedRectangle(cornerRadius: 21.0)
                            .stroke(Color("ButtonStrokeColor"),lineWidth: 2.0))
    }
}


struct PreviewView : View{
    var body: some View{
        VStack(spacing: 10, content: {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextView(text: "534")
        })
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
