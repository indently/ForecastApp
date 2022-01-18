//
//  MapView.swift
//  ForecastApp
//
//  Created by Federico on 18/01/2022.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @State private var mapOpacity = 0.0
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
            .opacity(mapOpacity)
            .onAppear {
                withAnimation(.easeIn(duration: 3)) {
                    mapOpacity = 1.0
                }
            }
    
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
