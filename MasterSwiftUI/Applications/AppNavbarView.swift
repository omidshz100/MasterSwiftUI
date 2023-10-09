//
//  AppNavbarView.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 30/09/23.
//

import SwiftUI

struct AppNavbarView: View {
    var body: some View {
        CustomNavView {
            ZStack{
                Color.green.ignoresSafeArea()
                
                NavigationLink(destination:
                                Text("Destination View")
                    .navigationTitle("Destination View TITLE")
                    .navigationBarBackButtonHidden(false)
                ) {
                    Text("Click me to see! ...")
                }
            }
        }
    }
}


extension AppNavbarView{
    private var defaultNavView: some View {
        NavigationView{
            ZStack{
                Color.green
                
                NavigationLink(destination:
                                Text("Destination View")
                    .navigationTitle("Destination View TITLE")
                    .navigationBarBackButtonHidden(false)
                ) {
                    Text("Click me to see! ...")
                }
            }.ignoresSafeArea()
                .navigationTitle("Hello First Page")
        }
    }
}
#Preview {
    AppNavbarView()
}
