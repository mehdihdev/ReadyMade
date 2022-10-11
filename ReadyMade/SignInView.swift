//
//  SignInView.swift
//  ReadyMade
//
//  Created by Mehdi Hussain on 9/28/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignInView: View {

    @State var email = ""
    @State var password = ""
    @State var sucess: Bool = false
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.PrimaryColor)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("ReadyMade")
                    .foregroundColor(.white)
                    .font(.system(size:36))
                    .bold()
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(maxWidth: 370, maxHeight: 140)
                        .foregroundColor(.white)
                    VStack {
                        TextField("Email", text: $email)
                            .padding(.all)
                        SecureField("Password", text: $password)
                            .padding(.all)
                    }
                    .padding()
                    .textFieldStyle(.plain)
                }
                Spacer()
                // Da Buttons
                NavigationLink(destination:StaffView(filter: .none).environmentObject(Prospects()), isActive: $sucess) {
                    EmptyView()
                }
                Button("Sign In") {
                  login()
                }
                    .frame(width: 256, height: 50)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(15)

                Button("Sign Up") {
                  // some code
                }
                    .frame(width: 256, height: 50)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.white, lineWidth: 2))
                    
                        
                
            }.foregroundColor(.green)
        }

    }
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                
            } else {
                sucess = true
                print("success")
            }
        }
    }
    
    
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
