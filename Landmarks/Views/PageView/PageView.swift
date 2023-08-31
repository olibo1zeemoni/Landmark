//
//  PageView.swift
//  Landmarks
//
//  Created by Olibo moni on 31/08/2023.
//

import SwiftUI

struct PageView<Page: View> : View {
    var pages: [Page]
    @State private var currentPage = 0
    @State private var direction = UIPageViewController.NavigationDirection.forward
     
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                PageViewController(pages: pages, currentPage: $currentPage, direction: $direction)
                    
                Text("Currrent Page: \(currentPage + 1)")
            }
            .padding(-14)
            
            HStack {
                
                Button {
                    guard currentPage > 0 else {
                        currentPage = pages.count - 1
                        direction = .reverse
                        return
                    }
                    direction = .reverse
                    currentPage -= 1
                } label: {
                    Label("next page", systemImage: "chevron.backward")
                        .foregroundStyle(.white)
                        .labelStyle(.iconOnly)
                        .font(.title)
                        .bold()
                    
                }
                
                Spacer()
                
                Button {
                    guard currentPage < (pages.count - 1) else {
                        direction = .forward
                        currentPage = 0
                        return
                    }
                    direction = .forward
                    currentPage += 1
                } label: {
                    Label("next page", systemImage: "chevron.forward")
                        .foregroundStyle(.white)
                        .labelStyle(.iconOnly)
                        .font(.title)
                        .bold()
                    
                }
            }
            .padding(2)
        }
    }
}

#Preview("Page View") {
    PageView(pages: ModelData().features.map({ FeatureCard(landmark: $0) }))
        .aspectRatio(1.5, contentMode: .fit)
}
