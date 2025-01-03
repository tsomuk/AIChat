//
//  ExploreView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI

struct ExploreView: View {
    
    let avatar = AvatarModel.mock
    
    var body: some View {
        NavigationStack {
            HeroCellView(
                title: avatar.name,
                subtitle: avatar.characterDescription,
                imageName: avatar.profileImageName
            )
                .navigationTitle("Explore")
        }
    }
}

#Preview {
    NavigationStack {
        ExploreView()
            .frame(width: 300, height: 220)
    }
}
