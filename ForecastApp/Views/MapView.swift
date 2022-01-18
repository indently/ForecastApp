//
//  MapView.swift
//  ForecastApp
//
//  Created by Federico on 18/01/2022.
//

import SwiftUI
import MapKit
import UIKit


struct MapView: View {
    
    @State private var region =
    MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 55.6760968, longitude: 12.5683371), span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0))
    @State private var mapOpacity = 0.0
    
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
            .opacity(mapOpacity)
            .onAppear {
                withAnimation(.easeIn(duration: 3)) {
                    mapOpacity = 1.0
                }
            }
            .onTapGesture {
                print("Tapped")
            }
    }
    
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
