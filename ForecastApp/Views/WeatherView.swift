//
//  WeatherView.swift
//  ForecastApp
//
//  Created by Federico on 18/01/2022.
//

import SwiftUI

struct WeatherView: View {
    @State var weatherList: [String]
    @State var city: String
    
    var body: some View {
        VStack {
            Text("Weather for \(city)")
                .bold()
                .padding()
                
            List {
                ForEach(weatherList, id: \.self) { weather in
                    Text("\(weather)")
                        .bold()
                        .padding()
                }
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weatherList: [""], city: "Sample City")
    }
}
