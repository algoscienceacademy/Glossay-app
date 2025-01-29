//
//  Tab.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Codeuniverse on 13/06/24.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
    
    
}
var tabItems = [

    TabItem(text: "home", icon: "house", tab: .home , color: .teal),
    TabItem(text: "explore", icon: "sparkle.magnifyingglass", tab: .explore , color: .blue),
    TabItem(text: "mycard",icon:"cart", tab: .mycard , color: .red),
    TabItem(text: "account", icon: "person", tab: .account , color: .purple)
    

]



enum Tab: String {
    
    case home
    case explore
    case mycard
    case account
}
