//
//  AdProvider.swift
//  AppodealTest
//
//  Created by Максим Митрофанов on 16.09.2023.
//

import SwiftUI
import Appodeal

class AdProvider: NSObject, ObservableObject {
    @Published private(set) var isBannerReady = false
    @Published private(set) var automaticBannerCount = 0
    @Published private(set) var manualBannerCount = 0
    @Published private(set) var canShowMoreBanners = true
    @Published var bannerDisplayMode: BannerDisplayMode = .manual {
        didSet {
            canShowMoreBanners = didNotReachMaxRepeatCount
        }
    }
    
    private override init() {
        super.init()
        Appodeal.initialize(withApiKey: AdConstants.appKey, types: AdConstants.adTypes)
        Appodeal.setBannerAnimationEnabled(true)
        Appodeal.setBannerDelegate(self)
    }
    
    static let shared = AdProvider()
    
    enum BannerDisplayMode: String {
        case manual, automatic
        
        var description: String {
            self.rawValue.capitalized
        }
    }
}

extension AdProvider: AppodealBannerDelegate {
    func bannerDidShow() {
        switch bannerDisplayMode {
        case .manual:
            manualBannerCount += 1
            hideTopBanner()
        case .automatic:
            automaticBannerCount += 1
            if automaticBannerCount > 1 {
                hideTopBanner()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                    self?.presentBanner()
                }
            }
        }
    }
    
    func presentBanner() {
        guard didNotReachMaxRepeatCount else { canShowMoreBanners = false; return }
        guard Appodeal.canShow(.banner, forPlacement: AdConstants.bannerPlacement) else { return }
        guard let viewController = UIApplication.shared.rootViewController else { return }
        
        Appodeal.showAd(
            .bannerTop,
            forPlacement: AdConstants.bannerPlacement,
            rootViewController: viewController
        )
    }
    
    func hideTopBanner() {
        Appodeal.hideBanner()
    }
    
    private var didNotReachMaxRepeatCount: Bool {
        switch bannerDisplayMode {
        case .automatic: return automaticBannerCount < AdConstants.automaticBannerMaxCount
        case .manual: return manualBannerCount < AdConstants.manualBannerMaxCount
        }
    }
}
