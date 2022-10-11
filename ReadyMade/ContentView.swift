//
//  ContentView.swift
//  ReadyMade
//
//  Created by Mehdi Hussain on 9/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .foregroundColor(.PrimaryColor)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    HStack {
                        ZStack {
                            Circle()
                                .frame(maxWidth: 256, alignment: .trailing)
                            Image("ReadyMadeLogo")
                        }
                    }
                    .foregroundColor(.white)
                    Text("ReadyMade")
                        .foregroundColor(.white)
                        .font(.system(size:36))
                        .bold()
                    Spacer()
                    // Da Buttons
                    
                    NavigationLink(destination: StudentSignIn()) {
                        Text("Student")
                            .frame(width: 256, height: 50)
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(15)
                    }


                    NavigationLink(destination: SignInView()) {
                        Text("Staff")
                            .frame(width: 256, height: 50)
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(15)
                    }
                            
                    
                }.foregroundColor(.green)
            }
        }
        

    }
}
extension Color {
    static let oldPrimaryColor = Color(UIColor.systemIndigo)
    static let PrimaryColor = Color("PrimaryColor")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
