//
//  View+EXT.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//
import SwiftUI

extension View {
    func callToActionButton(background: Color = .accent, foregroundColor: Color = .white) -> some View {
        self
            .font(.headline)
            .foregroundColor(foregroundColor)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(background)
            .cornerRadius(16)
    }
    
    func tappableBackground() -> some View {
        background(Color.black.opacity(0.001))
    }
    
    func removeRowViewFormatting() -> some View {
        self
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowBackground(Color.clear)
    }
    
    func addingGradientBackgroundForText() -> some View {
        self
            .background(
                LinearGradient(colors: [
                    .black.opacity(0),
                    .black.opacity(0.3),
                    .black.opacity(0.4)
                ], startPoint: .top, endPoint: .bottom)
            )
    }
}
