//
//  AsyncCallToActionButton.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 07.01.2025.
//

import SwiftUI

struct AsyncCallToActionButton: View {
    
    var isLoading: Bool
    var title: String
    var action: () -> Void
    
    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .tint(.white)
            } else {
                Text(title)
            }
        }
        .callToActionButton()
        .anyButton(.press) { action() }
        .disabled(isLoading)
    }
}

#Preview {
    VStack(spacing: 25) {
        AsyncCallToActionButton(isLoading: true, title: "", action: {})
        AsyncCallToActionButton(isLoading: false, title: "Finish", action: {})
    }
    .padding()
}
