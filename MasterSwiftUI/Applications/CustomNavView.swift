//
//  CustomNavView.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 01/10/23.
//

import SwiftUI

struct CustomNavView<Content:View> : View {
    
    let content:Content
    
    init(@ViewBuilder content: () -> Content ) {
        self.content = content()
    }
    var body: some View {
        NavigationView{
            CustomNavBarContainer {
                content
            }
            .navigationBarHidden(true)
        }.navigationViewStyle(.stack)
    }
}

#Preview {
    CustomNavView(){
        Color.green.ignoresSafeArea()
    }
}
