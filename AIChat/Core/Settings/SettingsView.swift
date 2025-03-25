//
//  SettingsView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.authService) private var authService
    @Environment(AppState.self) private var appState
    @State private var isPremium: Bool = false
    @State private var isAnonymousUser: Bool = false
    @State private var showCreateAccountView: Bool = false
    @State private var showAlert: AnyAppAlert?

    var body: some View {
        NavigationStack {
            List {
                accountSection
                purchasesSection
                applicationSection
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showCreateAccountView, onDismiss: {
                    setAnonymousAccountStatus()
                }, content: {
                    CreateAccountView()
                        .presentationDetents([.medium])
                })
            .onAppear {
                setAnonymousAccountStatus()
            }
            .showCustomAlert(alert: $showAlert)
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
                    onDeleteAccountPressed()
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
        Task {
            do {
                try authService.signOut()
                await dismissScreen()
            } catch {
                showAlert = AnyAppAlert(error: error)
            }
        }
    }
    
    private func dismissScreen() async {
        dismiss()
        try? await Task.sleep(for: .seconds(0.5))
        appState.updateViewState(showTabBarView: false)
    }
    
    private func onDeleteAccountPressed() {
        showAlert = AnyAppAlert(
            title: "Delete account",
            subtitle: "This action is permanent and cannot be undone. Your data will be deleted forever.",
            buttons: {
                AnyView(
                    Button("Delete", role: .destructive, action: {
                        onDeleteAccountConfirmed()
                    })
                )
            }
        )
    }
    
    private func onDeleteAccountConfirmed() {
        Task {
            do {
                try await authService.deleteAccount()
                await dismissScreen()
            } catch {
                showAlert = AnyAppAlert(error: error)
            }
        }
    }
    
    private func setAnonymousAccountStatus() {
        isAnonymousUser = authService.getAuthenticatedUser()?.isAnonymous == true
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

#Preview("No auth") {
    SettingsView()
        .environment(\.authService, MockAuthService(user: nil))
        .environment(AppState())
}

#Preview("Anonymous") {
    SettingsView()
        .environment(\.authService, MockAuthService(user: UserAuthInfo.mock(isAnonymous: true)))
        .environment(AppState())
}

#Preview("Not anonymous") {
    SettingsView()
        .environment(\.authService, MockAuthService(user: UserAuthInfo.mock(isAnonymous: false)))
        .environment(AppState())
}
