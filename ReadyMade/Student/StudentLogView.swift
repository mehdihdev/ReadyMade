//
//  StudentLogView.swift
//  ReadyMade
//
//  Created by Mehdi Hussain on 9/27/22.
//

import SwiftUI

struct StudentLogView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.PrimaryColor)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    ZStack {
                        Circle()
                            .frame(maxWidth: 80, alignment: .leading)
                        Image("ReadyMadeLogo")
                            .resizable()
                            .frame(width: 60, height: 63.47)
                    }.frame(maxWidth: 80, alignment: .leading)
                    VStack(alignment: .leading) {
                        Text(Date(), style: .date)
                            .font(.system(size: 25))
                            .bold()
                        Text("Student Account")
                            .font(.system(size: 14))
                    }

                }
                .foregroundColor(.white)
                VStack(alignment: .leading){
                    
                    Text("Student, will you be ordering lunch today?")
                        .foregroundColor(.white)
                        .font(.system(size:36))
                        .frame(maxWidth: 300)
                        .bold()
                    
                }

                Spacer()
                // Da Buttons
                Button("Yes") {
                    self.dismiss()
                }
                    .frame(width: 256, height: 50)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(15)

                Button("No") {
                  // some code
                }
                    .frame(width: 256, height: 50)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(15)
                Button("I didn't bring lunch money") {
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
}


struct StudentLogView_Previews: PreviewProvider {
    static var previews: some View {
        StudentLogView()
    }
}
