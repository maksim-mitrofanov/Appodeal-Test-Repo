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
            Spacer()

            bannerDisplayModeSelector
            Button("Present banner") {
                adProvider.presentBanner()
            }
            .buttonStyle(.bordered)
            .disabled(!adProvider.canShowMoreBanners)
        }
        .padding()
    }
    
    private var bannerDisplayModeSelector: some View {
        HStack {
            Menu {
                Button("Show ads manually") {
                    adProvider.bannerDisplayMode = .manual
                }
                Button("Show ads automatically") {
                    adProvider.bannerDisplayMode = .automatic
                }
            } label: {
                VStack(alignment: .leading){
                    HStack {
                        Text("Select banner display mode: ")
                            .bold()
                            .foregroundColor(.black)
                        Text(adProvider.bannerDisplayMode.description)
                            .foregroundColor(.blue)
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            Spacer()
        }
        .animation(nil, value: adProvider.bannerDisplayMode)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
