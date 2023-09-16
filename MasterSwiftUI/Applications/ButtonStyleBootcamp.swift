//
//  ButtonStyleBootcamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 14/07/23.
//

import SwiftUI



struct ButtonStyleBootcamp: View {
    var body: some View {
        return VStack{
            
            Button{
                
            }label: {
                Text("Click me!")
            }
            .padding()
            //.buttonStyle(PressableButtonStyle())
            .withPressableStyle()
        }
    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}
