//
//  PaymentMethodsView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Codeuniverse on 13/06/24.
//

import SwiftUI

struct PaymentMethodsView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var payVM = PaymentViewModel.shared
    @State var isPicker: Bool = false
    var didSelect:( (_ obj: PaymentModel) -> () )?
    
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
                LazyVStack(spacing: 15) {
                    ForEach( payVM.listArr , id: \.id, content: {
                        pObj in
                        
                        HStack(spacing: 15) {
                            
                            Image("paymenth_methods")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                            
                            VStack(spacing: 4){
                                Text(pObj.name)
                                    .font(.customfont(.bold, fontSize: 18))
                                    .foregroundColor(.primaryText)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                Text("**** **** **** \(pObj.cardNumber) ")
                                    .font(.customfont(.medium, fontSize: 15))
                                    .foregroundColor(.primaryApp)
                                    .multilineTextAlignment( .leading)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                            }
                            
                            Button {
                                payVM.serviceCallRemove(pObj: pObj)
                            } label: {
                                Image("close")
                                    .resizable()
                                
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                            }
                        }
                        .padding(15)
                        
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.15), radius: 2)
                        .onTapGesture {
                            if(isPicker) {
                                mode.wrappedValue.dismiss()
                                didSelect?(pObj)
                            }
                        }
                        
                        
                        
                    })
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)
                
            }
            
            
            VStack {
                
                HStack{
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    
                    
                    Spacer()
                    
                    Text("Payment Methods")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    NavigationLink {
                        AddPaymentMethodView( )
                    } label: {
                        Image("add_temp")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    .foregroundColor(.primaryText)
                    
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
            }
            
          }
            
        }
        .background(LinearGradient(colors: [Color.green.opacity(0.3),Color.orange.opacity(0.1),Color.yellow.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .alert(isPresented: $payVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(payVM.errorMessage) )
        })
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct PaymentMethodsView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            PaymentMethodsView()
        }
        
    }
}
