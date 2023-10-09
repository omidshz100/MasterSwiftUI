//
//  TabBarItemsPreferenceKey.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 19/09/23.
//

import Foundation
import SwiftUI


struct TabBarItemPreferenceKey:PreferenceKey {
    static var defaultValue: [TabBarItem] = []
   
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}

// dectleration of viewModifier
struct TabBarItemViewModifier: ViewModifier {
    let tabItem:TabBarItem
    @Binding var selection:TabBarItem
    
    
    func body(content: Content) -> some View {
        content
        // switchin between views is happening here
            .opacity(selection == tabItem ? 1.0:0.03 )
            .preference(key: TabBarItemPreferenceKey.self, value: [tabItem] )
    }
}
// making easy to use modifier by adding fuction to view
extension View  {
    func tabBarItem(tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        modifier(TabBarItemViewModifier(tabItem: tab, selection: selection   ))
    }
}
