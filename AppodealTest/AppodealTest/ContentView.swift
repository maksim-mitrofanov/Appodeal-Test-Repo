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
            showBannerButton
            showInterstitialButton
            showRewardedButton
        }
        .padding()
    }
    
    private var showRewardedButton: some View {
        Button("Show rewarded video") {
            adProvider.showRewardedVideo()
        }
        .buttonStyle(.borderedProminent)
    }
    
    
    private var showInterstitialButton: some View {
        Button("Show interstitial") {
            adProvider.showInterstitial()
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var showBannerButton: some View {
        Button("Present banner") {
            adProvider.showBanner()
        }
        .buttonStyle(.borderedProminent)
        .disabled(!adProvider.canShowMoreBanners)
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
