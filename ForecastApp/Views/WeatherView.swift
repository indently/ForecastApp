//
//  WeatherView.swift
//  ForecastApp
//
//  Created by Federico on 18/01/2022.
//

import SwiftUI

struct WeatherView: View {
    @State private var weatherList = [String]()
    
    var body: some View {
        List {
            ForEach(weatherList, id: \.self) { weather in
                
                Text("\(weather)")
                    .bold()
                    .padding()
                    
            }
        }
        .onAppear {
            WeatherAPI().getData { data in
                
                for weather in data.list {
                    
                    let epocTime = TimeInterval(weather.dt)
                    let myDate = NSDate(timeIntervalSince1970: epocTime)
                    let fDate = formatDate(myDate as Date)
                    
                    let tempString = "\(fDate) : \(weather.main.temp) C"
                    weatherList.append(tempString)
                    
                 
                }
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
