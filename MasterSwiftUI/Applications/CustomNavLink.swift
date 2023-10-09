//
//  CustomNavLink.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 01/10/23.
//

import SwiftUI

struct CustomNavLink<Label:View, Destination:View> : View {
    
    let destination: Destination
    let label:Label
    
    init(destination: Destination, @ViewBuilder label: ()->Label ) {
        self.destination = destination
        self.label = label()
    }
    var body: some View {
        NavigationLink {
                destination
        } label: {
            label
        }

    }
}

#Preview {
    CustomNavView {
        ZStack{
            Color.white
            CustomNavLink(destination: Text("Destination ... ")) {
                Text("The label of link")
            }
        }
    }
}
