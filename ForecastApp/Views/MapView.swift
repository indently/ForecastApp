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
    @State private var mapOpacity = 0.0
    
    
    var body: some View {
        MapViewCustom()
    }
    
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
