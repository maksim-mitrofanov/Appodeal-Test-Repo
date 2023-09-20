//
//  NativeUIKitView.swift
//  AppodealTest
//
//  Created by Максим Митрофанов on 18.09.2023.
//

import Foundation
import Appodeal
import SwiftUI

final class NativeUIKitView: UIView {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var callToAction: UILabel!
    
    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var mediaContainer: UIView!
    @IBOutlet weak var adChoices: UIView!
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
        
        self.icon.layer.cornerRadius = 8.0
        self.icon.layer.masksToBounds = true
        
        self.callToAction.layer.cornerRadius = 20.0
        self.callToAction.layer.masksToBounds = true
    }
}


extension NativeUIKitView : APDNativeAdView {
    func titleLabel() -> UILabel {
        return title
    }
    
    func callToActionLabel() -> UILabel {
        return callToAction
    }
    
    func descriptionLabel() -> UILabel {
        return descr
    }
    
    func iconView() -> UIImageView {
        return icon
    }
    
    func mediaContainerView() -> UIView {
        return mediaContainer
    }
    
    func adChoicesView() -> UIView {
        return adChoices
    }
    
    static func nib() -> UINib {
        return UINib.init(nibName: "Native", bundle: Bundle.main)
    }
}


extension APDNativeAd {
    struct Native: UIViewRepresentable {
        let ad: APDNativeAd
        
        func makeUIView(context: UIViewRepresentableContext<Native>) -> NativeUIKitView {
            guard
                let viewController = UIApplication.shared.rootViewController,
                let uiView = uiView(for: viewController)
            else {
                return NativeUIKitView()
            }
            return uiView
        }
        
        func updateUIView(_ uiView: NativeUIKitView, context: UIViewRepresentableContext<Native>) {}
        
        private func uiView(for viewController: UIViewController) -> NativeUIKitView? {
            return try? ad.getViewForPlacement(
                "default",
                withRootViewController: viewController
            ) as? NativeUIKitView
        }
    }
    
    var view: AnyView {
        AnyView(
            Native(ad: self)
                .shadow(color: .gray.opacity(0.2), radius: 10, x: 2, y: 2)
                .frame(height: 450)
        )
    }
}
