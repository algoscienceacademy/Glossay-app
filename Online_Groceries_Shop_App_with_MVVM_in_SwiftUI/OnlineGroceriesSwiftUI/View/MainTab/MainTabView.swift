//
//  MainTabView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Codeuniverse on 13/06/24.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTab: Tab = .home
    @State var color: Color = .teal
    var body: some View {
        ZStack(alignment: .bottom){
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .explore:
                    ExploreView()
                case .mycard:
                    MyCartView()
                case .account:
                    AccountView()

                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            HStack{
                ForEach(tabItems) { item in
                    Button(action: {
                        withAnimation{
                            selectedTab = item.tab
                            color = item.color
                        }
                        
                    }, label: {
                        VStack() {
                            
                            Image(systemName: item.icon)
                               .symbolVariant(.fill)
                                .font(.body.bold())
                                .frame(width:44, height: 29)
                            Text(item.text)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                        
                    }
                    
                
                    
                    )
                   .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
                    .blendMode(selectedTab == item.tab ? .overlay : .normal)
                 }
                    
            }
            
            .padding(.horizontal, 8)
            .padding(.top,14)
            .frame( height: 100, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 35,  style: .continuous)
                
                
            )
            .background(
                HStack {
                    if selectedTab == .account { Spacer()}
                    if selectedTab == .explore { Spacer()}
                    if selectedTab == .mycard
                    {   Spacer()
                        Spacer()
                    }
                    Circle().fill(color).frame(width:88)
                    if selectedTab == .home { Spacer()}
                    if selectedTab == .explore
                    {   Spacer()
                        Spacer()
                    }
                    if selectedTab == .mycard {Spacer()}
                }
                   .padding(.horizontal,8)
            )
            .overlay(
                HStack {
                    if selectedTab == .account { Spacer()}
                    if selectedTab == .explore { Spacer()}
                    if selectedTab == .mycard
                    {   Spacer()
                        Spacer()
                    }
                    Rectangle()
                        .fill(color)
                        .frame(width:35, height:5)
                        .cornerRadius(3)
                        .frame(width: 88)
                        .frame(maxHeight:.infinity, alignment:.top)
                    if selectedTab == .home { Spacer()}
                    if selectedTab == .explore
                    {   Spacer()
                        Spacer()
                    }
                    if selectedTab == .mycard {Spacer()}
                }
                    .padding(.horizontal,8)
            )
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            
        }
    }
}

#Preview {
NavigationView{
        MainTabView()
    }
}


