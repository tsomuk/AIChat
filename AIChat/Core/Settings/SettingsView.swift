//
//  SettingsView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            List {
                Button("Sign out") {
                    onSignOutPressed()
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    private func onSignOutPressed() {
        // do some logic to sign out of app
        dismiss()
        Task {
            try? await Task.sleep(for: .seconds(0.5))
            appState.updateViewState(showTabBarView: false)
        }
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
