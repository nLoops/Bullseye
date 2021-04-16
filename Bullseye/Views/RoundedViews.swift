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
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength )
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"),
                                  lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedImageViewFilled: View {
    
    var systemName:String
    
    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength )
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
            .frame(width: Constants.General.roundRectViewWidth,height: Constants.General.roundRectViewHeight)
            .background(RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                            .stroke(Color("ButtonStrokeColor"),lineWidth: Constants.General.strokeWidth))
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
