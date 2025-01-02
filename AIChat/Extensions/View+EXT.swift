//
//  View+EXT.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//
import SwiftUI

extension View {
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.accent)
            .cornerRadius(16)
    }
    
    func tappableBackground() -> some View {
        background(Color.black.opacity(0.001))
    }
    
}
