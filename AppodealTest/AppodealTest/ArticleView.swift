//
//  ArticleView.swift
//  AppodealTest
//
//  Created by Максим Митрофанов on 19.09.2023.
//

import SwiftUI

struct ArticleView: View {
    let model: ArticleDataModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 20) {
                articleLogo
                
                Text(model.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.bottom, 2)
                
                Spacer()
            }
            .padding(.top)
            .padding(.leading)
            
            Image(model.image)
                .resizable()
                .aspectRatio(1200/627, contentMode: .fit)
                .frame(height: 200)
            
            VStack(alignment: .leading) {
                Text(model.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                
                readMoreButton
                    .padding(.top)
            }
            .padding()
        }
        .background {
            Rectangle()
                .foregroundColor(.white)
        }
        .cornerRadius(24)
        .shadow(color: .gray.opacity(0.2), radius: 10, x: 2, y: 2)
    }
    
    private var readMoreButton: some View {
        Button {
            
        } label: {
            HStack {
                Spacer()
                Text("Read more")
                    .foregroundColor(.white)
                    .bold()
                Spacer()
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 100)
                    .foregroundColor(.red.opacity(0.8))
            }
        }
    }
    
    private var articleLogo: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .overlay {
                    Image(model.logo)
                        .resizable()
                        .scaledToFit()
                }
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 1)
        }
        .aspectRatio(1/1, contentMode: .fit)
        .frame(width: 50)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static let data = ArticleDataModel.generate(numberOfTemplates: 10)
    
    static var previews: some View {
        ScrollView {
            ForEach(data) { model in
                ArticleView(model: model)
            }
            .padding()
        }
    }
}
