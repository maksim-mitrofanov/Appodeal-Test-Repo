//
//  AdProvider.swift
//  AppodealTest
//
//  Created by Максим Митрофанов on 16.09.2023.
//

import SwiftUI
import Combine
import Appodeal

class AdProvider: NSObject, ObservableObject {
    private var isBannerReady = false
    private var displayedBannerCount = 0
    @Published private(set) var canShowMoreBanners = false
    
    private var isInterstitialReady = false
    private var interstitialTimePassed = true
    private var interstitialTimer: Timer? = nil
    private var displayedInterstitialCount = 0
    @Published private(set) var canShowMoreInterstitials = false
    
    private var isRewardedVideoReady = false
    private var displayedRewardedVideoCount = 0
    @Published private(set) var canShowMoreRewardedVideos = false
        
    private override init() {
        super.init()
        Appodeal.initialize(withApiKey: AdConstants.appKey, types: AdConstants.adTypes)
        Appodeal.setBannerDelegate(self)
        Appodeal.setInterstitialDelegate(self)
        Appodeal.setRewardedVideoDelegate(self)
        startTimerForInterstitial()
    }
    
    static let shared = AdProvider()
}


// MARK: - Rewarded Video
extension AdProvider: AppodealRewardedVideoDelegate {
    func showRewardedVideo() {
        defer { canShowMoreRewardedVideos = false }
        guard Appodeal.canShow(.rewardedVideo, forPlacement: "default") else { return }
        guard let viewController = UIApplication.shared.rootViewController else { return }
        
        Appodeal.showAd(.rewardedVideo, forPlacement: "default", rootViewController: viewController)
    }
    
    func rewardedVideoDidLoadAdIsPrecache(_ precache: Bool) {
        if displayedRewardedVideoCount < AdConstants.rewardedVideoMaxCount {
            canShowMoreRewardedVideos = true
        }
    }
    
    func rewardedVideoDidPresent() {
        displayedRewardedVideoCount += 1
        hideBanner()
    }
    
    func rewardedVideoDidFinish(_ rewardAmount: Float, name rewardName: String?) {
        showBanner()
    }
    
    func rewardedVideoDidFailToLoadAd() {
        canShowMoreRewardedVideos = false
    }
}

// MARK: - Interstitial
extension AdProvider: AppodealInterstitialDelegate {
    func showInterstitial() {
        defer { canShowMoreInterstitials = false; interstitialTimePassed = false }
        guard Appodeal.canShow(.interstitial, forPlacement: AdConstants.interstitialPlacement) else { return }
        guard let viewController = UIApplication.shared.rootViewController else { return }
        
        Appodeal.showAd(.interstitial, forPlacement: AdConstants.interstitialPlacement, rootViewController: viewController)
    }
    
    func interstitialDidLoadAdIsPrecache(_ precache: Bool) {
        if interstitialTimePassed {
            canShowMoreInterstitials = true
        }
    }
    
    func interstitialDidFailToLoadAd() {
        canShowMoreInterstitials = false
    }
    
    func interstitialWillPresent() {
        hideBanner()
    }
    
    func interstitialDidDismiss() {
        showBanner()
    }
    
    private func startTimerForInterstitial() {
        interstitialTimer?.invalidate()
        let timeInterval = TimeInterval(AdConstants.interstitialPauseInSeconds)
        
        interstitialTimer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { [weak self] _ in
            self?.interstitialTimePassed = true
        }
        
        if let timer = interstitialTimer {
            RunLoop.current.add(timer, forMode: .common)
        }
    }
}

// MARK: - Banner
extension AdProvider: AppodealBannerDelegate {
    func showBanner() {
        defer { canShowMoreBanners = false }
        guard Appodeal.canShow(.banner, forPlacement: AdConstants.bannerPlacement) else { return }
        guard let viewController = UIApplication.shared.rootViewController else { return }
        
        Appodeal.showAd(
            .bannerTop,
            forPlacement: AdConstants.bannerPlacement,
            rootViewController: viewController
        )
    }
    
    func bannerDidLoadAdIsPrecache(_ precache: Bool) {
        if displayedBannerCount < AdConstants.bannerMaxCount {
            canShowMoreBanners = true
        }
    }
    
    #warning("Bug: The first banner is only shown for 1 second, other banners are shown for 15 seconds.")
    func bannerDidShow() {
        displayedBannerCount += 1
    }
    
    private func hideBanner() {
        Appodeal.hideBanner()
    }
}
