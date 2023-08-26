//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Olibo moni on 24/08/2023.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
