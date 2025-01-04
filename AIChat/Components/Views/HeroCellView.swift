//
//  HeroCellView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 03.01.2025.
//

import SwiftUI

struct HeroCellView: View {
    
    var title: String? = "Some title"
    var subtitle: String? = "This is subtitle for the cell"
    var imageName: String? = Constants.randomImage
    
    var body: some View {
        ZStack {
            if let imageName {
                ImageLoaderView(urlString: imageName)
            } else {
                Rectangle()
                    .fill(.accent)
            }
        }
        .overlay(alignment: .bottomLeading, content: {
            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.headline)
                }
                
                if let subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                }
                
            }
            .foregroundStyle(.white)
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .addingGradientBackgroundForText()
        })
        .cornerRadius(16)
    }
}

#Preview {
    ScrollView {
        VStack {
            HeroCellView(title: nil)
                .frame(width: 350, height: 150)
            
            HeroCellView()
                .frame(width: 300, height: 200)
            
            HeroCellView(subtitle: nil)
                .frame(width: 200, height: 200)
            
            HeroCellView(imageName: nil)
                .frame(width: 200, height: 200)
            
            HeroCellView()
                .frame(width: 150, height: 400)
        }
        .frame(maxWidth: .infinity)
    }
}
