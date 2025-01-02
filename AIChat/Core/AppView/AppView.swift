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
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Tabbar!")
                }
            },
            onboardingView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Onboarding!")
                }
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
