//
//  MyDetailsView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Codeuniverse on 13/06/24.
//

import SwiftUI
import CountryPicker

struct MyDetailsView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var myVM = MyDetailsViewModel.shared
    
   
    
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
                    
                    
                    LineTextField(title: "Name", placholder: "Enter you name" , txt: $myVM.txtName)
                    
                    
                    VStack {
                        Text("Mobile")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.textTitle)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        
                        HStack{
                            
                            Button {
                                myVM.isShowPicker = true
                                
                            } label: {
                                if let countryObj = myVM.countryObj {
                                    
                                    Text( "\( countryObj.isoCode.getFlag())")
                                        .font(.customfont(.medium, fontSize: 35))
                                    
                                    Text( "+\( countryObj.phoneCode )")
                                        .font(.customfont(.medium, fontSize: 18))
                                        .foregroundColor(.primaryText)
                                }
                                
                            }
                            
                            TextField("Enter you mobile number", text:  $myVM.txtMobile)
                                .keyboardType(.numberPad)
                                .frame(minWidth: 0, maxWidth: .infinity)
                            
                        }
                        
                        Divider()
                        
                    }
                    
                    LineTextField(title: "Username", placholder: "Enter you username" , txt: $myVM.txtUsername)
                    
                    
                    
                    
                    RoundButton(title: "Update") {
                        myVM.serviceCallUpdate()
                    }
                    .padding(.bottom, 45)
                    
                    NavigationLink {
                        ChangePasswordView()
                    } label: {
                        Text("Change Password")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryApp)
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
                    
                    Text( "My Details")
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

        .sheet(isPresented: $myVM.isShowPicker, content: {
            CountryPickerUI(country: $myVM.countryObj)
        })
        .alert(isPresented: $myVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(myVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct MyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MyDetailsView()
    }
}
