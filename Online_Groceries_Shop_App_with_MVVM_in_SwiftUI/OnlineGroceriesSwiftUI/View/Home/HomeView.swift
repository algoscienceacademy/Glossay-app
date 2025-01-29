//
//  HomeView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Codeuniverse on 13/06/24.//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel.shared
    
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
                ScrollView{
                    VStack{
                        Image("color_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                        
                        HStack{
                            Image("location")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16 )
                            
                            Text("Dhaka, Banassre")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.darkGray)
                        }
                        
                        SearchTextField(placholder: "Search Store", txt: $homeVM.txtSearch)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                    }
                    .padding(.top, .topInsets )
                    
                    Image("banner_top")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 115)
                        .padding(.horizontal, 20)
                    
                    SectionTitleAll(title: "Exclusive offer", titleAll: "See All") {
                        
                    }
                    .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false ) {
                        LazyHStack(spacing: 15) {
                            ForEach (homeVM.offerArr, id: \.id) {
                                pObj in
                                
                                ProductCell(pObj: pObj, didAddCart: {
                                    
                                    CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                        
                                        self.homeVM.errorMessage = msg
                                        self.homeVM.showError = true
                                    }
                                })
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                    }
                    
                    
                    SectionTitleAll(title: "Best Selling", titleAll: "See All") {
                        
                    }
                    .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false ) {
                        LazyHStack(spacing: 15) {
                            ForEach (homeVM.bestArr, id: \.id) {
                                pObj in
                                
                                ProductCell(pObj: pObj, didAddCart: {
                                    CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                        
                                        self.homeVM.errorMessage = msg
                                        self.homeVM.showError = true
                                    }
                                })
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                    }
                    
                    SectionTitleAll(title: "Groceries", titleAll: "See All") {
                        
                    }
                    .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false ) {
                        LazyHStack(spacing: 15) {
                            ForEach (homeVM.typeArr, id: \.id) {
                                tObj in
                                
                                CategoryCell(tObj: tObj) {
                                    
                                }
                            }
                            
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                    }
                    .padding(.bottom, 8)
                    
                    ScrollView(.horizontal, showsIndicators: false ) {
                        LazyHStack(spacing: 15) {
                            ForEach (homeVM.listArr, id: \.id) {
                                pObj in
                                
                                ProductCell(pObj: pObj, didAddCart: {
                                    CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                        
                                        self.homeVM.errorMessage = msg
                                        self.homeVM.showError = true
                                    }
                                })
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                    }
                    .padding(.bottom, .bottomInsets + 60)
                    
                }
            }
        }
        .background(LinearGradient(colors: [Color.green.opacity(0.3),Color.orange.opacity(0.4),Color.yellow.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .alert(isPresented: $homeVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(homeVM.errorMessage), dismissButton: .default(Text("OK")) )
        })
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
