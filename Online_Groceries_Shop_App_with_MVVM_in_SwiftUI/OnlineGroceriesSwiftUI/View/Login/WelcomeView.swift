//
//  WelcomeView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Codeuniverse on 13/06/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            
            LinearGradient(colors: [Color.yellow.opacity(0.4),Color.red.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                .overlay(
                    VStack{
            Image("Hamburger-pana")
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 400)
            
            VStack{
                
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 8)
                
                Text( "Welcome\nto our store")
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text( "Ger your groceries in as fast as one hour")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                NavigationLink(destination: SignInView().navigationBarBackButtonHidden(false))
                {
                    
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black,lineWidth:2)
                            .fill(LinearGradient(colors: [Color.yellow.opacity(0.5),Color.red.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 320,height: 70)
                            .overlay(
                                Text("Get Start")
                                    .foregroundColor(.black)
                                    .bold()
                                
                            )
                    }

               
                
                Spacer()
                    .frame(height: 80)
                
            }
            .padding(.horizontal , 20)
        }
       )
                    
       }
        
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
        
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            WelcomeView()
        }
        
    }
}
