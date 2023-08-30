//
//  MapView.swift
//  Landmarks
//
//  Created by Olibo moni on 25/08/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map(initialPosition: initialPosition)
    }
    
    
    var initialPosition: MapCameraPosition {
           let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
           let region = MKCoordinateRegion(center: coordinate, span: span)
           return .region(region)
       }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
