//
//  ProfileModalView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 16.01.2025.
//

import SwiftUI

struct ProfileModalView: View {
    
    var imageName: String? = Constants.randomImage
    var title: String? = "Alpha"
    var subtitle: String? = "Alien"
    var headline: String? = "Alien in the park."
    var onXMarkPressed: () -> Void = {}
    
    var body: some View {
        
        VStack(spacing: 0) {
            if let imageName {
                ImageLoaderView(urlString: imageName)
                    .aspectRatio(1, contentMode: .fit)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                if let subtitle {
                    Text(subtitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                if let headline {
                    Text(headline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .drawingGroup()
        .background(.thinMaterial)
        .cornerRadius(16)
        .overlay(
            Image(systemName: "xmark.circle.fill")
                .font(.title)
                .padding(4)
                .tappableBackground()
                
                .anyButton(.press) {
                    onXMarkPressed()
                }
                .padding(8)
            , alignment: .topTrailing)
        
    }
}

#Preview("model with image") {
    ZStack {
        Color.purple.ignoresSafeArea()
        ProfileModalView()
            .padding(40)
    }
}

#Preview("model w/o image") {
    ZStack {
        Color.purple.ignoresSafeArea()
        ProfileModalView(imageName: nil)
            .padding(40)
    }
}
