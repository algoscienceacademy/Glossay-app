//
//  AddPaymentMethodView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Codeuniverse on 13/06/24.
//

import SwiftUI

struct AddPaymentMethodView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var payVM = PaymentViewModel.shared
    
    
    var body: some View {
        ZStack {
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
                VStack(spacing: 15){
                    
                    
                    
                    LineTextField(title: "Name", placholder: "Enter you name" , txt: $payVM.txtName)
                    
                    LineTextField(title: "Card Number", placholder: "Enter card number", txt: $payVM.txtCardNumber, keyboardType: .numberPad)
                    
                    
                    
                    HStack{
                        LineTextField(title: "MM", placholder: "Enter Month" , txt: $payVM.txtCardMonth, keyboardType: .numberPad)
                        LineTextField(title: "YYYY", placholder: "Enter Year" , txt: $payVM.txtCardYear, keyboardType: .numberPad)
                    }
                    
                    
                    RoundButton(title:  "Add Payment Method") {
                        
                        payVM.serviceCallAdd {
                            self.mode.wrappedValue.dismiss()
                        }
                        
                    }
                    
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                
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
                    
                    Text("Add Payment Method")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    
                    
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
        .alert(isPresented: $payVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(payVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct AddPaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        AddPaymentMethodView()
    }
}
