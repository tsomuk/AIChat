//
//  AppView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI

struct AppView: View {
    
    @AppStorage("showTabarView") var showTabBar: Bool = false
    
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
    }
}

#Preview("Appview - Tabbar") {
    AppView(showTabBar: true)
}

#Preview("Appview - Onboarding") {
    AppView(showTabBar: false)
}
