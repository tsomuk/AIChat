//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var root

    var body: some View {
        VStack {
            Text("Onboarding completed")
                .frame(maxHeight: .infinity)
            
            Button {
                onFinishButtonPressed()
            } label: {
                Text("Finish")
                    .callToActionButton()
            }
        }
        .padding(16)

    }
    
    func onFinishButtonPressed() {
        root.updateViewState(showTabBarView: true)
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
