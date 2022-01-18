//
//  ContentView.swift
//  ForecastApp
//
//  Created by Federico on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var navTitle = "Today"
    var body: some View {
        VStack {
            TabController()
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
