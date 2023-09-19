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
    static let adTypes: AppodealAdType = [.banner, .interstitial, .rewardedVideo, .nativeAd]
    
    static let bannerMaxCount = 5
    static let bannerPlacement: String = "bannerRestriction"
    
    static let interstitialPauseInSeconds = 60
    static let interstitialPlacement: String = "interstitialRestriction"
    
    static let rewardedVideoMaxCount = 3
    
    static let nativeAdAspectRatio: CGFloat = 16/9
}
