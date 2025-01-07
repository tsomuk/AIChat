//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var root
    @State private var isCompletingProfileSetup: Bool = false
    var selectedColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Setup complete!")
                .font(.largeTitle)
                .fontDesign(.rounded)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)
            
            Text("We've set up your profile and you're ready to start chatting.")
                .font(.title)
                .fontDesign(.rounded)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(
            edge: .bottom,
            content: {
                AsyncCallToActionButton(
                    isLoading: isCompletingProfileSetup,
                    title: "Finish",
                    action: onFinishButtonPressed
                )
            })
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    func onFinishButtonPressed() {
        isCompletingProfileSetup = true
        Task {
//            try await saveUserColor(color: selectedColor)
            try await Task.sleep(for: .seconds(3))
            isCompletingProfileSetup = false
            root.updateViewState(showTabBarView: true)
        }
    }
}

#Preview {
    OnboardingCompletedView(selectedColor: .mint)
        .environment(AppState())
}
