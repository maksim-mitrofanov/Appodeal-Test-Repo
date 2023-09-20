//
//  NativeAdsList.swift
//  AppodealTest
//
//  Created by Максим Митрофанов on 18.09.2023.
//

import SwiftUI
import Combine
import Appodeal

struct NativeAdsList: View {
    @ObservedObject var adProvider: AdProvider
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                if adProvider.newsFeedContent.isEmpty {
                    ProgressView()
                } else {
                    ScrollView(.vertical) {
                        VStack {
                            ForEach(self.adProvider.newsFeedContent, id: \.id) {
                                $0.view
                                    .padding()
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("News feed")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Go back") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct FeedContent: Identifiable {
    typealias ID = UUID
    let id: UUID
    var view: AnyView {
        switch data {
        case is ArticleDataModel: return AnyView(ArticleView(model: (data as! ArticleDataModel)))
        case is APDNativeAd: return (data as! APDNativeAd).view
        default: return AnyView(EmptyView())
        }
    }
    
    var data: Any
    
    init(data: Any) {
        self.data = data
        self.id = UUID()
    }
}


struct NativeAdsList_Previews: PreviewProvider {
    static var previews: some View {
        NativeAdsList(adProvider: AdProvider.shared)
    }
}
