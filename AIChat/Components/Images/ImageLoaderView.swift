//
//  ImageLoaderView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString = Constants.randomImage
    var resizingMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            )
        .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 100, height: 200)
}
