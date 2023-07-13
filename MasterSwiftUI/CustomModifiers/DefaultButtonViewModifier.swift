//
//  DefaultButtonViewModifier.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 11/07/23.
//

import Foundation
import SwiftUI


//
struct DefaultButtonViewModifier:ViewModifier {
    var color:Color
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(color)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    func withDefaultButtonViewModifier(color:Color = Color.blue)-> some View {
        self.modifier(DefaultButtonViewModifier(color: color))
    }
}
