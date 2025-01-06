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
    @State private var isPremium: Bool = true
    @State private var isAnonymousUser: Bool = false
    @State private var showCreateAccountView: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                accountSection
                purchasesSection
                applicationSection
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showCreateAccountView) {
                CreateAccountView()
                    .presentationDetents([.medium])
            }
        }
    }
    
    private var accountSection: some View {
        Section {
            if isAnonymousUser {
                Text("Save & back-up account")
                    .rowFormation()
                    .anyButton(.highlight) {
                        onCreateAccountPressed()
                    }
                    .removeListRowFormatting()
            } else {
                Text("Sign out")
                    .rowFormation()
                    .anyButton(.highlight) {
                        onSignOutPressed()
                        
                    }
                    .removeListRowFormatting()
            }
               
            Text("Delete account")
                .foregroundStyle(.red)
                .rowFormation()
                .anyButton(.highlight) {
                    // DELETE
                }
                .removeListRowFormatting()
        } header: {
            Text("Account")
        }
    }
    
    private var purchasesSection: some View {
        Section {
            HStack(spacing: 8) {
                Text("Account status: \(isPremium ? "PREMIUM" : "FREE")")
                Spacer(minLength: 0)
                if isPremium {
                    Text("MANAGE")
                        .badgeButton()
                }
            }
            .rowFormation()
            .anyButton(.highlight, action: {
                // add logic
            })
            .disabled(!isPremium)
            .removeListRowFormatting()
        } header: {
            Text("Purchases")
        }
    }
    
    private var applicationSection: some View {
        Section {
            HStack {
                Text("Version")
                Spacer()
                Text(Utilities.appVersion ?? "")
                    .foregroundStyle(.secondary)
            }
                .rowFormation()
                .removeListRowFormatting()
            
            HStack {
                Text("Build Number")
                Spacer()
                Text(Utilities.buildNumber ?? "")
                    .foregroundStyle(.secondary)
            }
                .rowFormation()
                .removeListRowFormatting()
            
            Text("Contact us")
                .foregroundStyle(.blue)
                .rowFormation()
                .anyButton(.highlight) {
                    // add logic
                }
                .removeListRowFormatting()
        } header: {
            Text("Application")
        } footer: {
            VStack(alignment: .leading, spacing: 6) {
                Text("Created by @tsomuk")
                Text("Learn more at www.tsomuk.ru")
            }
        }
    }
    
    private func onCreateAccountPressed() {
        showCreateAccountView = true
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

fileprivate extension View {
    func rowFormation() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(.background)
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
