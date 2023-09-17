//
//  AdConstants.swift
//  AppodealTest
//
//  Created by Максим Митрофанов on 16.09.2023.
//

import Appodeal
import Foundation

class AdConstants {
    private init() { }
    
    static let appKey = "04af8871592a92a40505fd51e8d48b14dd40a07ae51fb893"
    static let adTypes: AppodealAdType = [.banner, .interstitial, .rewardedVideo]
    static let bannerPlacement: String = "bannerRestriction"
    static let interstitialPlacement: String = "interstitialRestriction"
    static let automaticBannerMaxCount = 5
    static let manualBannerMaxCount = 5
}
