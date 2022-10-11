//
//  ReadyMadeApp.swift
//  ReadyMade
//
//  Created by Mehdi Hussain on 9/27/22.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct ReadyMadeApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

