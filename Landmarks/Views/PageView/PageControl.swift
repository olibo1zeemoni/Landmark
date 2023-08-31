//
//  PageControl.swift
//  Landmarks
//
//  Created by Olibo moni on 31/08/2023.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        
        
        return control
    }
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        uiView.currentPage = currentPage
    }
    
    
}
