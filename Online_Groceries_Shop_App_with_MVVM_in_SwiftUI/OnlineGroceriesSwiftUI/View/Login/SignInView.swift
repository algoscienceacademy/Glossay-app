//
//  SignInView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Codeuniverse on 13/06/24.
//

import SwiftUI

struct SignInView: View {
    
    @State var txtMobile: String = ""

    
    
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
                        VStack{
                            
                            
                            VStack(alignment: .leading){
                                Image("Order-food-bro")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 400)
                                
                                Text( "Get your groceries\nwith nectar")
                                    .font(.customfont(.semibold, fontSize: 26))
                                    .foregroundColor(.primaryText)
                                    .multilineTextAlignment(.leading)
                                    .padding(.bottom , 25)
                                    .offset(x:10)
                                NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)){
                                    
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.black,lineWidth:2)
                                        .fill(LinearGradient(colors: [Color.yellow.opacity(0.5),Color.blue.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .frame(width: 360,height: 60)
                                        .overlay(
                                            Text("Continue with Email Log In")
                                                .foregroundColor(.black)
                                                .bold()
                                            
                                        )
                                }
                                .offset(x:20)
                                
                                
                                NavigationLink(destination: SignUpView().navigationBarBackButtonHidden(true)){
                                    
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.black,lineWidth:2)
                                        .fill(LinearGradient(colors: [Color.yellow.opacity(0.5),Color.blue.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .frame(width: 360,height: 60)
                                        .overlay(
                                            Text("Continue with Email Sign Up")
                                                .foregroundColor(.black)
                                                .bold()
                                            
                                        )
                                }
                                .offset(x:20,y:10)
                                
                                Divider()
                                    .padding(.bottom, 25)
                                    .offset(y:25)
                                Text( "Or connect with social media")
                                    .font(.customfont(.semibold, fontSize: 14))
                                    .foregroundColor(.textTitle)
                                    .multilineTextAlignment(.center)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                                    .padding(.bottom , 25)
                                  
                                
                                
                            }
                            
                            
                            
                            
                            
                        }
                    )
                
               }
           
        
    }
        
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SignInView()
        }
    }
}
