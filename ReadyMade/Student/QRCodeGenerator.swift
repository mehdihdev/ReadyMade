//
//  QRCodeGenerator.swift
//  ReadyMade
//
//  Created by Mehdi Hussain on 10/2/22.
//

import SwiftUI

struct QRCodeGenerator: View {
    @Binding var qrcode: UIImage
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.PrimaryColor)
            VStack {
                Text("Student QR Code")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 30))
                Image(uiImage: qrcode)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }

        }.edgesIgnoringSafeArea(.all)
    }
}

