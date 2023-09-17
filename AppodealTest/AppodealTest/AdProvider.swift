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
    @Published private(set) var bannerDisplayMode: BannerDisplayMode? = nil
    
    private override init() {
        super.init()
        Appodeal.initialize(withApiKey: AdConstants.appKey, types: AdConstants.adTypes)
        Appodeal.setBannerAnimationEnabled(true)
        Appodeal.setBannerDelegate(self)
        Appodeal.setTestingEnabled(true)
    }
    
    static let shared = AdProvider()
    
    enum BannerDisplayMode {
        case manual, automatic
    }
}

extension AdProvider: AppodealBannerDelegate {
    func bannerDidShow() {
        automaticBannerCount += 1
        print("Banner count: \(automaticBannerCount)")
        
        if automaticBannerCount > 1 {
            hideTopBanner()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                self?.presentBanner()
            }
        }
    }
    
    func presentBanner() {
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
}
