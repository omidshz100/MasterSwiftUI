//
//  ButtonStyles.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 15/07/23.
//

import Foundation
import SwiftUI

struct PressableButtonStyle:ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.3:1.0)
            //.brightness(configuration.isPressed ? 1:0)
            //.scaleEffect(configuration.isPressed ? 1.8:1.0)
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(color: Color.blue.opacity(0.3),
                    radius: 10, x: 0, y: 10)
            
    }
}
extension View {
    func withPressableStyle()-> some View{
        self.buttonStyle(PressableButtonStyle())
    }
}
