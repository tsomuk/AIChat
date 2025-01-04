//
//  CustomListCellView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 04.01.2025.
//

import SwiftUI

struct CustomListCellView: View {
    
    var title: String? = "Some title"
    var subtitle: String? = "This is subtitle for the cell"
    var imageName: String? = Constants.randomImage
    
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                } else {
                    Rectangle()
                        .fill(.secondary.opacity(0.3))
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 60)
            .cornerRadius(16)
            
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
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .padding(.vertical, 4)
        .background(.background)
        
    }
}

#Preview {
    ZStack {
        Color.secondary.opacity(0.3).ignoresSafeArea()
        VStack {
            CustomListCellView()
            CustomListCellView(imageName: nil)
            CustomListCellView(title: nil)
            CustomListCellView(subtitle: nil)
        }
    }
}
