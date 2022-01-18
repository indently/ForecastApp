//
//  ContentView.swift
//  ForecastApp
//
//  Created by Federico on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var opac = 0.0
    
    var body: some View {
        VStack {
            MapViewCustom()
                .opacity(opac)
                .onAppear {
                    withAnimation(.easeIn(duration: 3)) {
                        opac = 1.0
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
