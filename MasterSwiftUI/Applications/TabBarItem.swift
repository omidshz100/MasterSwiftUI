//
//  TabBarItem.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 19/09/23.
//

import Foundation
import SwiftUI



//struct TabBarItem:Hashable {
//    let iconeName:String
//    let title:String
//    let color:Color
//}

//static let tabs:[TabBarItem] = [
//    TabBarItem(iconeName: "house", title: "Home", color: Color.blue),
//    TabBarItem(iconeName: "heart", title: "Favorite", color: Color.red),
//    TabBarItem(iconeName: "person", title: "Profile", color: Color.green),
//]
enum TabBarItem:Hashable {
    case home, favorite, profile
    var iconeName:String {
        switch self {
        case .home:
            return "house"
        case .favorite:
            return "heart"
        case .profile:
            return "person"
        }
    }
    
    var title:String {
        switch self{
        case.home:
            return "Home"
        case.favorite:
            return "Favorite"
        case.profile:
            return "Profile"
        }
    }
    
    var color:Color {
        switch self{
        case.home:
            return Color.blue
        case .favorite:
            return Color.red
        case .profile:
            return Color.green
        }
    }
}
