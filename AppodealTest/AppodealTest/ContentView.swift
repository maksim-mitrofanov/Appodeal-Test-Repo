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
            showBannerButton
            showInterstitialButton
            showRewardedButton
        }
        .padding()
    }
    
    private var showNativeAdButton: some View {
        Button("Show native ads") {
            
        }
        .buttonStyle(CustomButtonStyle())
        .disabled(!adProvider.canShowMoreNativeAds)
    }
    
    private var showRewardedButton: some View {
        Button("Show rewarded video") {
            adProvider.showRewardedVideo()
        }
        .buttonStyle(CustomButtonStyle())
        .disabled(!adProvider.canShowMoreRewardedVideos)
    }
    
    
    private var showInterstitialButton: some View {
        Button("Show interstitial") {
            adProvider.showInterstitial()
        }
        .buttonStyle(CustomButtonStyle())
        .disabled(!adProvider.canShowMoreInterstitials)
    }
    
    private var showBannerButton: some View {
        Button("Present banner") {
            adProvider.showBanner()
        }
        .buttonStyle(CustomButtonStyle())
        .disabled(!adProvider.canShowMoreBanners)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
