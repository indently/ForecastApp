//
//  LocationViewControllewr.swift
//  ForecastApp
//
//  Created by Federico on 18/01/2022.
//

import Foundation
import UIKit
import MapKit
import SwiftUI

struct MapViewCustom : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> FindLocationViewController {
        return FindLocationViewController()
    }
    func updateUIViewController(_ uiViewController: FindLocationViewController, context: Context) {
    }
}

protocol FindLocationViewControllerOutput: AnyObject {
    func viewIsReady()
    func locationSelected(at coordinate: CLLocationCoordinate2D)
}

final class FindLocationViewController: UIViewController {
    private lazy var mapView: MKMapView = MKMapView(frame: .zero)
    
    var output: FindLocationViewControllerOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(findLocation(_:)))
        mapView.addGestureRecognizer(gesture)
    }
    
    // <--------------- EDITED by Federico-------------------->
    @objc
    private func findLocation(_ gesture: UITapGestureRecognizer) {
        let point = gesture.location(in: mapView)
        dump(point)
        
        // Added the conversion to CLLocationCoordinate2D
        let tappedPosition = mapView.convert(point, toCoordinateFrom: mapView)
        // print("tappedPosition -> \(tappedPosition)") -- DEBUGGING
        
        // Get data on tap
        var tempCity = ""
        
        WeatherAPI().getData(lon: tappedPosition.longitude, lat: tappedPosition.latitude) { weather in
            // print(weather.city) -- DEBUGGING
            // print(weather.list) -- DEBUGGING
            tempCity = weather.city.name
            
            // Add the weather data together and turn it into a list.
            var weatherList = [String]()
            for data in weather.list {
                let fDate = formatDate(data.dt)
                
                let tempString = "\(fDate) : \(data.main.temp) C°"
                weatherList.append(tempString)
            }
            
            // Create the detail view
            let weatherView = WeatherView(weatherList: weatherList, lat: tappedPosition.longitude, lon: tappedPosition.latitude, city: tempCity)
            let viewController = UIHostingController(rootView: weatherView)
            self.present(viewController, animated: true)
        }
    }
}
