//
//  TabController.swift
//  ForecastApp
//
//  Created by Federico on 18/01/2022.
//

import SwiftUI

struct TabController: View {
    @State private var navTitle = "Today"
    
    var body: some View {
        NavigationView {
            TabView {
                WeatherView()
                    .tabItem {
                        Label("Weather", systemImage: "sun.min.fill")
                    }
                    .onAppear() {
                        navTitle = "Weather"
                    }
                    .navigationTitle(navTitle)
                
                MapView()
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
                    .onAppear() {
                        navTitle = "Map"
                    }
                    .navigationTitle(navTitle)
            }
        }
    }
}

struct TabController_Previews: PreviewProvider {
    static var previews: some View {
        TabController()
    }
}
