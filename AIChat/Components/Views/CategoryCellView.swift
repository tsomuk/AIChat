//
//  CategoryCellView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 04.01.2025.
//

import SwiftUI

struct CategoryCellView: View {
    
    var title: String = "Alliens"
    var imageName: String = Constants.randomImage
    var font: Font = .title2
    var cornerRadius: CGFloat = 16
    
    var body: some View {
        ImageLoaderView(urlString: imageName)
            .aspectRatio(1, contentMode: .fit)
            .overlay(alignment: .bottomLeading, content: {
                Text(title)
                    .font(font)
                    .padding(16)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .addingGradientBackgroundForText()
            })
            .cornerRadius(cornerRadius)
    }
}

#Preview {
    VStack {
        CategoryCellView()
            .frame(width: 150)
        
        CategoryCellView(cornerRadius: 50)
            .frame(width: 150)
        
        CategoryCellView(font: .largeTitle)
            .frame(width: 300)
    }
}
