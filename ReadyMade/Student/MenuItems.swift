//
//  MenuItems.swift
//  ReadyMade
//
//  Created by Mehdi Hussain on 9/28/22.
//

import SwiftUI
import Firebase

struct MenuItems: View {
    @ObservedObject var MenuModel = MenuViewModel()
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.PrimaryColor)
            List(MenuModel.list) { item in

                    VStack(alignment: .leading) {
                        Text(item.id)
                            .foregroundColor(.black)
                            .bold()
                        HStack {
                            Text("Menu Items: ")
                                .foregroundColor(.black)
                                .bold()
                            Text(item.items)
                                .foregroundColor(.black)
                        }
                        HStack {
                            Text("Lunch Price: ")
                                .foregroundColor(.black)
                                .bold()
                            Text("$\(Float(item.price), specifier: "%.2f")")
                                .foregroundColor(.black)
                        }
                                
                    }

            }.scrollContentBackground(.hidden)
                .background(Color.PrimaryColor)
            .onAppear {
                UITableView.appearance().sectionFooterHeight = 0
            }

        }

        
    }
    init() {
        MenuModel.getMenuData()
    }
}

struct MenuItems_Previews: PreviewProvider {
    static var previews: some View {
        MenuItems().previewLayout(.sizeThatFits)
    }
}
