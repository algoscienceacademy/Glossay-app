//
//  LoginView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Codeuniverse on 13/06/24.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared;
    
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.yellow.opacity(0.4),Color.blue.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ZStack{
                Circle()
                    .frame(width: 300)
                    .foregroundColor(.green.opacity(0.5))
                    .blur(radius: 10)
                    .offset(x:-250,y:-200)
                Circle()
                    .frame(width: 300)
                    .foregroundColor(.green.opacity(0.5))
                    .blur(radius: 10)
                    .offset(x:250,y:-300)
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: .infinity,height: 300)
                    .foregroundStyle(LinearGradient(colors: [Color.green.opacity(0.3),Color.green.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .blur(radius: 10)
                    .rotationEffect(.degrees(30))
                    .offset(x:90,y:400)
                    .overlay(
                        ZStack {
                            Image("bottom_b")
                                .resizable()
                                .scaledToFill()
                                .frame(width: .screenWidth, height: .screenHeight)
                            
                            
                            VStack{
                                
                                
                                
                                Image("color_logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40)
                                    .padding(.bottom, .screenWidth * 0.1)
                                
                                
                                Text("Loging")
                                    .font(.customfont(.semibold, fontSize: 26))
                                    .foregroundColor(.primaryText)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 4)
                                
                                Text("Enter your emails and password")
                                    .font(.customfont(.semibold, fontSize: 16))
                                    .foregroundColor(.secondaryText)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, .screenWidth * 0.1)
                                
                                LineTextField( title: "Email", placholder: "Enter your email address", txt: $loginVM.txtEmail, keyboardType: .emailAddress)
                                    .padding(.bottom, .screenWidth * 0.07)
                                
                                LineSecureField( title: "Password", placholder: "Enter your password", txt: $loginVM.txtPassword, isShowPassword: $loginVM.isShowPassword)
                                    .padding(.bottom, .screenWidth * 0.02)
                                
                                
                                NavigationLink {
                                    ForgotPasswordView()
                                } label: {
                                    Text("Forgot Password?")
                                        .font(.customfont(.medium, fontSize: 14))
                                        .foregroundColor(.primaryText)
                                }
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                .padding(.bottom, .screenWidth * 0.03)
                                
                                RoundButton(title: "Log In") {
                                    loginVM.serviceCallLogin()
                                }
                                .padding(.bottom, .screenWidth * 0.05)
                                
                                
                                NavigationLink {
                                    SignUpView()
                                } label: {
                                    HStack{
                                        Text("Don’t have an account?")
                                            .font(.customfont(.semibold, fontSize: 14))
                                            .foregroundColor(.primaryText)
                                        
                                        Text("Signup")
                                            .font(.customfont(.semibold, fontSize: 14))
                                            .foregroundColor(.primaryApp)
                                    }
                                }
                                
                                
                                
                                Spacer()
                            }
                            .padding(.top, .topInsets + 64)
                            .padding(.horizontal, 20)
                            .padding(.bottom, .bottomInsets)
                            
                            
                            VStack {
                                
                                HStack {
                                    Button {
                                        mode.wrappedValue.dismiss()
                                    } label: {
                                        Image("back")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                    }
                                    
                                    Spacer()
                                    
                                }
                                
                                Spacer()
                                
                            }
                            .padding(.top, .topInsets)
                            .padding(.horizontal, 20)
                            
                            
                            
                        }
                            .alert(isPresented: $loginVM.showError) {
                                
                                Alert(title: Text(Globs.AppName), message: Text( loginVM.errorMessage ), dismissButton: .default(Text("Ok")))
                            }
                           // .background(Color.white)
                            .navigationTitle("")
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true)
                           // .ignoresSafeArea()
                    )
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            LoginView()
        }
        
    }
}
