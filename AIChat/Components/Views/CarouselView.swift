//
//  CarouselView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 03.01.2025.
//

import SwiftUI

struct CarouselView<Content: View, T: Hashable>: View {
    
    let items: [T]
    @ViewBuilder var content: (T) -> Content
    @State private var selection: T?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(items, id: \.self) { item in
                            content(item)
                                .scrollTransition(.interactive.threshold(.visible(0.95)), transition: { content, phase in
                                    content
                                        .scaleEffect(phase.isIdentity ? 1 : 0.9)
                                })
                                .containerRelativeFrame(.horizontal, alignment: .center)
                                .id(item)
                        }
                    }
                }
                .scrollTargetLayout()
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                .scrollPosition(id: $selection)
                .frame(height: 200)
                .navigationTitle("Explore")
                .onAppear {
                    updateSelectionIfNeeded()
                }
            }
            .onChange(of: items.count) { _, _ in
                updateSelectionIfNeeded()
            }
            
            HStack {
                ForEach(items, id: \.self) { item in
                    Circle()
                        .foregroundStyle(selection == item ? .accent : .secondary.opacity(0.5))
                        .frame(width: 8)
                }
            }
            .animation(.linear, value: selection)
        }
    }
    private func updateSelectionIfNeeded() {
        if selection == nil || selection == items.last {
            selection = items.first
        }
    }
}

#Preview {
    NavigationStack {
        CarouselView(items: AvatarModel.mocks, content: { item in
            HeroCellView(
                title: item.name,
                subtitle: item.characterDescription,
                imageName: item.profileImageName
            )
        })
        .padding()
    }
}
