//
//  TabBarContainerView.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 18/09/23.
//

import SwiftUI

struct CustomTabBarContainerView<Content>: View where Content : View {
    let content:Content
    @Binding var selectionTab:TabBarItem
    @State var tabs:[TabBarItem] = [.favorite, .home, .profile]
    
    
    
    init(selection: Binding<TabBarItem> , @ViewBuilder  content: ()-> Content) {
        // اینجا به
        // _
        // توجه کن چون یک پروجکشن هستنش از بایندینگTabBarItem
        self._selectionTab = selection
        self.content = content()
    }
    
   
    //
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            CustomTabBarView(tabs: tabs, selection: $selectionTab)
        }
        .onPreferenceChange( TabBarItemPreferenceKey.self) { newValues in
            self.tabs = newValues
        }
    }
}

struct TabBarContainerView_Previews: PreviewProvider {
    static let tabs:[TabBarItem] = [.home,.favorite,.profile]
    
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
