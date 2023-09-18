//
//  CustomButtonStyle.swift
//  AppodealTest
//
//  Created by Максим Митрофанов on 18.09.2023.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label
                .font(.body)
            Spacer()
        }
        .frame(minHeight: minButtonHeight)
        .background { backgroundRect }
        .foregroundColor(.accentColor)
        .cornerRadius(cornerRadius)
        .opacity(configuration.isPressed ? 0.2 : 1.0)
        .padding(.horizontal)
        .animation(.easeInOut, value: isEnabled)
    }
    
    private var backgroundRect: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .strokeBorder(lineWidth: 1)
            .foregroundColor(.accentColor)
    }
    
    private let minButtonHeight: CGFloat = 50
    private let cornerRadius: CGFloat = 50
}

struct CustomButtonStyle_Previews: PreviewProvider {
    struct PreviewData: View {
        @State private var isSecondButtonDisabled = true
        
        var body: some View {
            VStack {
                Button("Custom Button 1") { isSecondButtonDisabled.toggle() }
                Button("Custom Button 2") { }
                    .disabled(isSecondButtonDisabled)
            }
            .buttonStyle(CustomButtonStyle())
        }
    }
    
    static var previews: some View {
        PreviewData()
    }
}
