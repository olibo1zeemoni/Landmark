//
//  ContentView.swift
//  Landmarks
//
//  Created by Olibo moni on 24/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    func printShit() {
        print("$$Dbg” AAAAA\(String(reflecting: self))")
    }
    
    var body: some View {
     LandmarkList()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
