//
//  AppView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI

struct AppView: View {
    
    @Environment(\.authService) private var authService
    @State var appState: AppState = AppState()
    
    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
        .task {
            await checkUserStatus()
        }
    }
    
    private func checkUserStatus() async {
        if let user = authService.getAuthenticatedUser() {
            // auth user
            print("✅ User already auth: \(user.uid)")
        } else {
            // user not auth
            
            do {
                let result = try await authService.signInAnonymously()
                print("♻️ Sign in anonymously result: \(result.user.uid)")
            } catch {
                print(error)
            }
        }
    }
}

#Preview("Appview - Tabbar") {
    AppView(appState: AppState(showTabBar: true))
}

#Preview("Appview - Onboarding") {
    AppView(appState: AppState(showTabBar: false))
}
