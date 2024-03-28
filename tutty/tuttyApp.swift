//
//  tuttyApp.swift
//  tutty
//
//  Created by Yusuf Erkoç on 28.03.2024.
//

import SwiftUI

@main
struct tuttyApp: App {
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
