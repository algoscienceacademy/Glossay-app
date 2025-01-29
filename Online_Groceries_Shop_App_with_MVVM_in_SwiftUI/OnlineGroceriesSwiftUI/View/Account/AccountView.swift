//
//  AccountView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Codeuniverse on 13/06/24.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack{
            ZStack{
                Circle()
                    .frame(width: 300)
                    .foregroundColor(.blue.opacity(0.5))
                    .blur(radius: 10)
                    .offset(x:-250,y:-200)
                Circle()
                    .frame(width: 300)
                    .foregroundColor(.blue.opacity(0.5))
                    .blur(radius: 10)
                    .offset(x:250,y:-300)
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: .infinity,height: 300)
                    .foregroundStyle(LinearGradient(colors: [Color.green.opacity(0.3),Color.blue.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .blur(radius: 10)
                    .rotationEffect(.degrees(30))
                    .offset(x:90,y:400)
                VStack{
                    
                    HStack(spacing: 15) {
                        Image("u1")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(30)
                        
                        VStack{
                            
                            HStack{
                                Text("Shahrear Hossain")
                                    .font(.customfont(.bold, fontSize: 20))
                                    .foregroundColor(.primaryText)
                                
                                Image(systemName: "pencil")
                                    .foregroundColor(.primaryApp)
                                
                                Spacer()
                            }
                            
                            Text("sshahrearhossain@gmail.com")
                                .font(.customfont(.regular, fontSize: 16))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading )
                                .accentColor(.secondaryText)
                            
                            
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, .topInsets)
                    
                    Divider()
                    
                    ScrollView {
                        LazyVStack {
                            
                            VStack{
                                
                                NavigationLink {
                                    MyOrdersView()
                                } label: {
                                    AccountRow(title: "My Orders", icon: "a_order")
                                }
                                
                                
                                NavigationLink {
                                    MyDetailsView()
                                } label: {
                                    AccountRow(title: "My Details", icon: "a_my_detail")
                                }
                                
                                
                                
                                NavigationLink {
                                    DelieryAddressView()
                                } label: {
                                    AccountRow(title: "Delivery Address", icon: "a_delivery_address")
                                }
                                
                                
                                NavigationLink {
                                    PaymentMethodsView()
                                } label: {
                                    AccountRow(title: "Payment Methods", icon: "paymenth_methods")
                                }
                                
                                NavigationLink {
                                    PromoCodeView()
                                } label: {
                                    AccountRow(title: "Promo Code", icon: "a_promocode")
                                }
                                
                                
                            }
                            
                            VStack{
                                NavigationLink {
                                    NotificationView()
                                } label: {
                                    AccountRow(title: "Notifications", icon: "a_noitification")
                                }
                                
                                AccountRow(title: "Help", icon: "a_help")
                                AccountRow(title: "About", icon: "a_about")
                            }
                            
                            Button {
                                MainViewModel.shared.logout()
                            } label: {
                                ZStack {
                                    Text("Log Out")
                                        .font(.customfont(.semibold, fontSize: 18))
                                        .foregroundColor(.primaryApp)
                                        .multilineTextAlignment(.center)
                                    
                                    HStack{
                                        Spacer()
                                        Image("logout")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                            .padding(.trailing, 20)
                                    }
                                }
                                
                            }
                            .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                            .background( Color(hex: "F2F3F2"))
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            
                        }
                        
                    }
                }
                .padding(.bottom, .bottomInsets + 60)
            }
            .background(LinearGradient(colors: [Color.green.opacity(0.3),Color.orange.opacity(0.1),Color.yellow.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .ignoresSafeArea()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            AccountView()
        }
        
    }
}
