//
//  SportFinderApp.swift
//  SportFinder
//
//  Created by Simon Lundgren on 24/02/2024.
//

import SwiftUI
import Firebase

@main
struct SportFinderApp: App {
    @StateObject var core = UserAuth()
    init(){FirebaseApp.configure()}
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(core)
        }
    }
}
