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
                PageViewController(pages: pages, currentPage: $currentPage, direction: $direction)
                    
                PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        
               // chevrons

        }
    }
}

#Preview("Page View") {
    PageView(pages: ModelData().features.map({ FeatureCard(landmark: $0) }))
        .aspectRatio(1.5, contentMode: .fit)
}




extension PageView {
    var chevrons: some View {
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
                                .labelStyle(.iconOnly)
                                .font(.title)
                                .bold()
        
                        }
        
                        Spacer()
        
                        Button {
                            guard currentPage < (pages.count - 1) else {
                                direction = .forward
                                withAnimation {
                                    currentPage = 0
                                }
                                return
                            }
                            direction = .forward
                            withAnimation {
                                currentPage += 1
                            }
                        } label: {
                            Label("next page", systemImage: "chevron.forward")
        
                                .labelStyle(.iconOnly)
                                .font(.title)
                                .bold()
        
                        }
                    }
                    .padding(2)
                    .padding(.vertical, 100)
                    .foregroundStyle(.blue)
    }
}
