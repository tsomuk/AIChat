//
//  OnboardingColorView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 03.01.2025.
//

import SwiftUI

struct OnboardingColorView: View {
    
    @State private var selectedColor: Color?
    let profileColors: [Color] = [.blue, .red, .green, .mint, .purple, .orange, .pink, .cyan, .indigo]
    
    var body: some View {
        ScrollView {
            colorGrid
            .padding(.horizontal, 24)
        }
        .safeAreaInset(
            edge: .bottom,
            alignment: .center,
            spacing: 16,
            content: {
                ZStack {
                    if let selectedColor {
                        ctaButton
                        .transition(.move(edge: .bottom))
                    }
                }
                .padding(24)
                .background(.background)
            }
        )
        .animation(.bouncy, value: selectedColor)
    }
    
    private var colorGrid: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3),
            alignment: .center,
            spacing: 16,
            pinnedViews: [.sectionHeaders],
            content: {
                Section(content: {
                    ForEach(profileColors, id: \.self) { color in
                        Circle()
                            .fill(.primary)
                            .overlay {
                                color
                                    .clipShape(.circle)
                                    .padding(selectedColor == color ? 6 : 0)
                            }
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                    
                }, header: {
                    Text("Choose your profile color")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                })
            }
        )
    }
    
    private var ctaButton: some View {
        NavigationLink {
            OnboardingCompletedView()
        } label: {
            Text("Continue")
                .callToActionButton()
        }
    }
    
}

#Preview {
    OnboardingColorView()
}
