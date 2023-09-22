//
//  AppTabBarView.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 17/09/23.
//

import SwiftUI

struct AppTabBarView: View {
    @State private var selected:String = "home"
    @State var tabBarSelection:TabBarItem = .profile
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabBarSelection) {
            Color.blue
                .tabBarItem(tab: .home, selection: $tabBarSelection)
            Color.red
                .tabBarItem(tab: .favorite, selection: $tabBarSelection)
            Color.green
                .tabBarItem(tab: .profile, selection: $tabBarSelection)
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarView()
    }
}









extension AppTabBarView {
    private var defaultTabView: some View {
        TabView{
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("home")
                }
            
            Color.red
                .tabItem {
                    Image(systemName: "home")
                    Text("home")
                }
            
            Color.red
                .tabItem {
                    Image(systemName: "home")
                    Text("home")
                }
            
        }
    }
}
