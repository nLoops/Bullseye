//
//  Shapes.swift
//  Bullseye
//
//  Created by Ahmed Ibrahim on 05/04/2021.
//

import SwiftUI

struct Shapes: View {
    
    @State private var isWideShapes = true
    
    var body: some View {
        VStack{
            if !isWideShapes{
                
                Circle()
                    //                .fill(Color.blue)
                    //                .stroke(Color.blue,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .strokeBorder(Color.blue,lineWidth: 20.0)
                    .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .transition(.scale)
            }
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color.blue)
                .frame(width: isWideShapes ?  200 : 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            
            //            Capsule()
            //                .fill(Color.blue)
            //            frame(width: 200, height: 100)
            //
            Ellipse()
                .fill(Color.blue)
                .frame(width: isWideShapes ?  200 : 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            
            
            Button(action: {
                withAnimation{
                    isWideShapes = !isWideShapes
                }
            }, label: {
                Text("Animate!")
            })
            
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
