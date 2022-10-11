//
//  StudentView.swift
//  ReadyMade
//
//  Created by Mehdi Hussain on 9/27/22.
//


import SwiftUI
import CoreImage.CIFilterBuiltins


struct StudentView: View {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    @Binding var balance: Double
    @Binding var name: String
    @Binding var lunchnumber: String
    @State var isactive = false
    @State var LogActive = false
    @State var QRCodeImage = UIImage(named: "ReadyMadeLogo")!
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.PrimaryColor)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack() {
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
                    Spacer()

                }.padding(.leading)
                .foregroundColor(.white)
                VStack(alignment: .leading){
                    Text("Welcome \(name)!")
                        .foregroundColor(.white)
                        .font(.system(size:36))
                        .bold()
                    Text("Balance: $\(balance, specifier: "%.2f")")
                        .foregroundColor(.white)
                        .font(.system(size:28))
                    
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(.white)
                        .frame(width: 300, height: 420)
                    MenuItems()
                }

                Spacer()
                // Da Buttons
                NavigationLink(destination: QRCodeGenerator(qrcode: $QRCodeImage), isActive: $isactive) {
                    EmptyView()
                }
                Button("Show QR Code") {
                  QRCode()
                }
                    .frame(width: 256, height: 50)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(15)
                    .padding(.bottom, 15)
                NavigationLink(destination: StudentLogView(), isActive: $LogActive) {
                    EmptyView()
                }
                Button("Log Food") {
                  LogFood()
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
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    func QRCode() {
        QRCodeImage = generateQRCode(from: lunchnumber)
        print(generateQRCode(from: lunchnumber))
        isactive = true
    }
    func LogFood() {
        LogActive = true
    }
}

/*
struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentView()
    }
}
*/
