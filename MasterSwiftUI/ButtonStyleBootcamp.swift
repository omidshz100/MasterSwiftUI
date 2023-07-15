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
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(color: Color.blue.opacity(0.3),
                            radius: 10, x: 0, y: 10)
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
