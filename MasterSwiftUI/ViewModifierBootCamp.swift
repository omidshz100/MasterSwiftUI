//
//  ContentView.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 11/07/23.
//

import SwiftUI

struct ViewModifierBootCamp: View {
    
    let colors:[Color] = [.red, .blue, .yellow, .pink, .brown, .gray, .cyan, .orange, .indigo]
    
    @State var sliderValue:Float = 0
    
    
    var body: some View {
        VStack {
            
            Slider(value: Binding(get: {
                print("Get time is happening")
                return self.sliderValue
            }, set: { newVal in
                self.sliderValue = newVal
                print("Do something while changing value with slider : \(newVal)")
            }), in: 0...Float(colors.count - 1), step: 1) {
                Text("Number")
            } minimumValueLabel: {
                Text("\(min(0, colors.count - 1))")
            } maximumValueLabel: {
                Text("\(colors.count - 1)")
            }

            
            Text("Hello, world!")
                .withDefaultButtonViewModifier(color: colors[Int(sliderValue)])
            
        }
        .padding()
    }
}

struct ViewModifierBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootCamp()
    }
}
