//
//  ChatRowCellView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 05.01.2025.
//

import SwiftUI

struct ChatRowCellView: View {
    
    var imageName: String? = Constants.randomImage
    var headline: String? = "Alpha"
    var subheadline: String? = "This is the last message in the chat"
    var hasNewChat: Bool = true
    
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                        .clipShape(.circle)
                } else {
                    Circle()
                        .fill(.secondary.opacity(0.3))
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                if let headline {
                    Text(headline)
                        .font(.headline)
                }
                if let subheadline {
                    Text(subheadline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if hasNewChat {
                Text("NEW")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 8)
                    .background(.blue)
                    .cornerRadius(6)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(.background)
        
    }
}

#Preview {
    List {
        ChatRowCellView()
            .removeRowViewFormatting()
        ChatRowCellView(hasNewChat: false)
            .removeRowViewFormatting()
        ChatRowCellView(imageName: nil)
            .removeRowViewFormatting()
    }
}
