//
//  OrderAccpetView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Codeuniverse on 13/06/24.
//

import SwiftUI

struct OrderAccpetView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
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
                    Spacer()
                    Image("order_accpeted")
                        .resizable()
                        .scaledToFit()
                        .frame(width: .screenWidth * 0.7)
                        .padding(.bottom, 32)
                    
                    Text("Your order has been \n accepted")
                        .multilineTextAlignment(.center)
                        .font(.customfont(.semibold, fontSize: 28))
                        .foregroundColor(.primaryText)
                        .padding(.bottom, 12)
                    
                    Text("Your items has been placcd and is on\nit’s way to being processed")
                        .multilineTextAlignment(.center)
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .padding(.bottom, 12)
                    
                    Spacer()
                    Spacer()
                    
                    RoundButton(title: "Track Order") {
                        
                    }
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Text("Back to home")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.primaryApp)
                            .padding(.vertical, 15)
                    }
                    .padding(.bottom , .bottomInsets + 15)
                    
                }
                .padding(.horizontal, 20)
            }
        }
        .background(LinearGradient(colors: [Color.green.opacity(0.3),Color.orange.opacity(0.4),Color.green.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct OrderAccpetView_Previews: PreviewProvider {
    static var previews: some View {
        OrderAccpetView()
    }
}
