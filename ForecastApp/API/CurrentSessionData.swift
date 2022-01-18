//
//  CurrentSessionData.swift
//  ForecastApp
//
//  Created by Federico on 18/01/2022.
//

import Foundation

class UserCoordinates: ObservableObject {
    @Published var lat = 0.0
    @Published var lon = 0.0
    
    func displayRestuls() {
        print(lat)
        print(lon)
    }
}
