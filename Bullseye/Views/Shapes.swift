//
//  Shapes.swift
//  Bullseye
//
//  Created by Ahmed Ibrahim on 05/04/2021.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack{
            Circle()
//                .fill(Color.blue)
//                .stroke(Color.blue,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .strokeBorder(Color.blue,lineWidth: 20.0)
                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color.blue)
                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
