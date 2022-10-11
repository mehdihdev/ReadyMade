//
//  StaffView.swift
//  ReadyMade
//
//  Created by Mehdi Hussain on 9/27/22.
//

import SwiftUI
import CodeScanner


struct StaffView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScanner = false
    @State private var totalChildren = 85
    @State private var children = 72
    @State private var diffChildren = 13
    let filter: FilterType

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
                        Text("Staff Account")
                            .font(.system(size: 14))
                    }
                    Spacer()

                }.padding(.leading)
                .foregroundColor(.white)
                VStack(alignment: .leading){
                    Text("Welcome Aditi!")
                        .foregroundColor(.white)
                        .font(.system(size:36))
                        .bold()
                        .padding(.bottom)
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.white)
                        VStack(alignment: .leading) {
                            Text("Menu Items")
                                .foregroundColor(.black)
                                .bold()
                                .font(.system(size: 25))
                            Text("Pizza, Apples, Bananas, Yogurt")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                            Text("Price: $2.75")
                                .foregroundColor(.black)
                                .font(.system(size:16))
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.white)
                         
                        VStack(alignment: .leading) {
                            Text(String(children) + " students left today")
                                .foregroundColor(.black)
                                .bold()
                                .font(.system(size: 25))
                            Text(String(totalChildren - children) + " students scanned today")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                            Text(String(totalChildren) + " recieving food today")
                                .foregroundColor(.black)
                                .font(.system(size:16))
                        }
                    }

                }.padding(.all)

                Spacer()
                // Da Buttons

                Button("Scan QR Code") {
                    isShowingScanner = true
                }   .frame(width: 256, height: 50)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(15)
                
      
                
            }.foregroundColor(.green)
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson", completion: handleScan)
                }
        }

    }
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 1 else { return }
            let person = Prospect()
            person.name = details[0]
            prospects.add(person)
            print(children)
            children -= 1
            print(children)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted }
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }
}

struct StaffView_Previews: PreviewProvider {
    static var previews: some View {
        StaffView(filter: .none).environmentObject(Prospects())
    }
}
