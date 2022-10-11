//
//  StudentSignIn.swift
//  ReadyMade
//
//  Created by Mehdi Hussain on 9/28/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct StudentSignIn: View {
    @State var name = ""
    @State var balance = Double(5.00)
    @State var lunchnumber = ""
    @State private var showingAlert = false
    @State var studentsuccess: Bool = false
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
                        .frame(maxWidth: 370, maxHeight: 80)
                        .foregroundColor(.white)
                    VStack {
                        TextField("Lunch Number", text: $lunchnumber)
                            .padding(.all)

                    }
                    .padding()
                    .textFieldStyle(.plain)
                }
                Spacer()
                // Da Buttons
                NavigationLink(destination:StudentView(balance: $balance, name: $name, lunchnumber: $lunchnumber), isActive: $studentsuccess) {
                    EmptyView()
                }
                Button("Sign In") {
                    getStudentData(LunchNumber: lunchnumber)
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("Sign In Error"), message: Text("Student lunch number does not exist"), dismissButton: .default(Text("Try Again")))
                }
                    .frame(width: 256, height: 50)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(15)

   
                        
                
            }.foregroundColor(.green)
        }

    }
    func getStudentData(LunchNumber: String) {
        let db = Firestore.firestore()
        let docRef = db.collection("students").document(LunchNumber)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                name = document.get("name") as? String ?? ""
                balance = document.get("balance") as? Double ?? 0.00
                studentsuccess = true
            } else {
                showingAlert = true
                print("Document does not exist")
            }
        }
    }
}

struct StudentSignIn_Previews: PreviewProvider {
    static var previews: some View {
        StudentSignIn()
    }
}
