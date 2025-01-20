//
//  CategoryListView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 20.01.2025.
//

import SwiftUI

struct CategoryListView: View {
    
    var category: CharacterOption = .default
    var imageName: String = Constants.randomImage
    @State private var avatars: [AvatarModel] = AvatarModel.mocks
    
    var body: some View {
        List {
            CategoryCellView(
                title: category.plural.capitalized,
                imageName: imageName,
                font: .largeTitle,
                cornerRadius: 0
            )
            .removeListRowFormatting()
            
            ForEach(avatars, id: \.self) { avatar in
                CustomListCellView(
                    title: avatar.name,
                    subtitle: avatar.characterDescription,
                    imageName: avatar.profileImageName
                )
                .removeListRowFormatting()
            }
            
        }
        .listStyle(.plain)
        .ignoresSafeArea()
    }
}

#Preview {
    CategoryListView()
}
