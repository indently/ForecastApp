//
//  APIRequest.swift
//  ForecastApp
//
//  Created by Federico on 18/01/2022.
//

import Foundation

struct Weather: Codable {
    var cod: String
    var message: Int
    var cnt: Int
    var list: [WeatherList]
    var city: WeatherCity
}

struct WeatherList: Codable {
    var dt: Int
    var main: WeatherDetails
}

struct WeatherDetails: Codable {
    var temp: Double
    var feels_like: Double
}

struct WeatherCity: Codable {
    var id: Int
    var name: String
    var coord: Coord
}

struct Coord: Codable {
    var lat: Double
    var lon: Double
}

class WeatherAPI : ObservableObject {
    private let API_KEY = "870761e49da34e680b73eb62f5edfee3"
    
    func getData(lon: Double, lat: Double, completion:@escaping (Weather) -> ()) {
            guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=\(API_KEY)&units=metric") else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                
                let weather = try! JSONDecoder().decode(Weather.self, from: data)
                
                DispatchQueue.main.async {
                    completion(weather)
     
                }
            }.resume()
        }
}
