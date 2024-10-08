//
//  ChatApplicationApp.swift
//  ChatApplication
//
//  Created by Raman Tank on 04/10/24.
//

import SwiftUI
import Firebase

@main
struct ChatApplicationApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
