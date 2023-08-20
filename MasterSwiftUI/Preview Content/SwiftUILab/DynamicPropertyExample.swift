//
//  DynamicProperty.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 16/08/23.
//

import SwiftUI



@propertyWrapper struct LastUpdate: DynamicProperty {
    var wrappedValue: Date = Date()

    mutating func update() {
        wrappedValue = Date()
    }
}

struct DynamicPropertyExample: View {
    @LastUpdate var lastUpdate: Date
    @State private var flag = false
    
    var body: some View {
        VStack(spacing: 20) {
            if flag {
                Color.green.frame(width: 30, height: 30)
            } else {
                Color.blue.frame(width: 30, height: 30)
            }
            
            HStack {
                Button("Green") { flag = true }
                
                Button("Blue") { flag = false }
            }
            
            VStack {
                Text("View last updated ") + Text(lastUpdate, style: .relative) + Text(" ago")
            }
        }
    }
}

struct DynamicProperty_Previews: PreviewProvider {
    static var previews: some View {
        DynamicPropertyExample()
    }
}
