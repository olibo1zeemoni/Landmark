//
//  PageView.swift
//  Landmarks
//
//  Created by Olibo moni on 31/08/2023.
//

import SwiftUI

struct PageView<Page: View> : View {
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
    }
}

#Preview {
    PageView(pages: ModelData().features.map({ FeatureCard(landmark: $0) }))
        .aspectRatio(1.5, contentMode: .fit)
}
