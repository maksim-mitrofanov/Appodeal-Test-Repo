//
//  ArticleDataModel.swift
//  AppodealTest
//
//  Created by Максим Митрофанов on 19.09.2023.
//

import Foundation

struct ArticleDataModel: Identifiable {
    let title: String
    let description: String
    let image: String
    let logo: String
    let id: UUID = UUID()
    
    static let template = ArticleDataModel(title: "Title", description: loremIpsum, image: "content_0", logo: "news_1")
    static func generate(numberOfTemplates number: Int) -> [ArticleDataModel] {
        return (0..<number).map { number in
            ArticleDataModel(title: "Title \(number)", description: loremIpsum , image: "content_\(number % 4)", logo: "news_\(number % 4)")
        }
    }
    
    static let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus nisl id tempor congue. Vivamus venenatis eros in mi ullamcorper tristique. Proin vulputate, mi eu."
}
