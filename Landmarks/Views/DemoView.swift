//
//  DemoView.swift
//  Landmarks
//
//  Created by Olibo moni on 26/08/2023.
//

import SwiftUI

struct DemoView: View {
    @State private var someBool = false
    
    func printShit() {
        print("$$Dbg” AAAAA\(String(reflecting: self))")
    }

    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundColor(!someBool ? .red : .blue)
                .onTapGesture {
                    someBool.toggle()
            }
            Button {
                printShit()
            } label: {
                Text("Button")
            }

        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
