//
//  CustomNavBarContainer.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 30/09/23.
//

import SwiftUI

struct CustomNavBarContainer<Content>: View where Content:View {
    
    let content:Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        VStack(spacing:0){
            CustomNavBarView()
            content
                .frame(width: .infinity, height: .infinity)
        }
        
    }
}

#Preview {
    CustomNavBarContainer(){
        ZStack{
            Color.yellow.ignoresSafeArea()
            Text("Hello world")
                .foregroundColor(.blue)
        }
    }
}
