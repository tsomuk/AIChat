//
//  ExploreView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var featuredAvatars: [AvatarModel] = AvatarModel.mocks
    @State private var categories: [CharacterOption] = CharacterOption.allCases
    
    var body: some View {
        NavigationStack {
            List {
                featuredSection
                categoriesSection
            }
            .navigationTitle("Explore")
        }
    }
    
    private var featuredSection: some View {
        Section {
            ZStack {  // Fix glitch during scrolling between items
                CarouselView(items: featuredAvatars) { avatar in
                    HeroCellView(
                        title: avatar.name,
                        subtitle: avatar.characterDescription,
                        imageName: avatar.profileImageName
                    )
                }
            }
            .removeRowViewFormatting()
        } header: {
            Text("Featured Avatars")
        }
    }
    
    private var categoriesSection: some View {
        Section {
            ZStack {  // Fix glitch during scrolling between items
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            CategoryCellView(
                                title: category.rawValue.capitalized,
                                imageName: Constants.randomImage
                            )
                        }
                    }
                }
                .frame(height: 140)
                .scrollIndicators(.hidden)
                .scrollTargetLayout()
                .scrollTargetBehavior(.viewAligned)
            }
            .removeRowViewFormatting()
        } header: {
            Text("Categories")
        }
    }
    
}

#Preview {
    NavigationStack {
        ExploreView()
        
    }
}
