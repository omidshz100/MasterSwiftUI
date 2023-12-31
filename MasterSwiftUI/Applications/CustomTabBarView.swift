//
//  CustomTabBarView.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 18/09/23.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs:[TabBarItem]
    @Binding var selection:TabBarItem
    @Namespace var nameSpace
    var body: some View {
        tabBarVersion2
    }
    
    private func switchToTab(targetTab:TabBarItem){
        withAnimation(.easeOut(duration: 0.2)) {
            selection = targetTab
        }
    }
}


extension CustomTabBarView {
    private func tabView1(tab: TabBarItem)-> some View {
        VStack{
            Image(systemName: tab.iconeName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab ? tab.color:Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(selection == tab ? tab.color.opacity(0.2): Color.clear)
        .cornerRadius(10)
    }
    
    private var tabBarVersion1: some View {
        HStack{
            ForEach(tabs, id: \.self) { tab in
                tabView1(tab: tab)
                    .onTapGesture {
                        switchToTab(targetTab: tab)
                    }
            }
        }.padding(6)
        .background(Color.white.ignoresSafeArea(edges:.bottom))
    }
}


extension CustomTabBarView {
    private func tabView2(tab: TabBarItem)-> some View {
        VStack{
            Image(systemName: tab.iconeName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab ? tab.color:Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack{
                if selection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_Rectangle_", in: nameSpace)
                }
            }
        )
        .cornerRadius(10)
    }
    
    private var tabBarVersion2: some View {
        HStack{
            ForEach(tabs, id: \.self) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(targetTab: tab)
                    }
            }
        }.padding(6)
        .background(Color.white.ignoresSafeArea(edges:.bottom))
        .cornerRadius(10)
        .shadow(color:Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal, 2)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    // fake Data
    static let tabs:[TabBarItem] = [.home,.favorite,.profile]
    static var previews: some View {
        VStack{
            Spacer()
            CustomTabBarView(tabs:  tabs, selection: .constant(tabs[1]))
        }
    }
}




