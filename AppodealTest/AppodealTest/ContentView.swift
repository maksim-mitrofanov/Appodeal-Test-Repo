//
//  ContentView.swift
//  AppodealTest
//
//  Created by Максим Митрофанов on 16.09.2023.
//

import SwiftUI
import Appodeal

struct ContentView: View {
    @StateObject private var adProvider = AdProvider.shared
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            Button("Present banner") {
                adProvider.presentBanner()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
