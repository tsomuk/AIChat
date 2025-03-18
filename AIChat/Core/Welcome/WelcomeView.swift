//
//  WelcomeView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var imageName = Constants.randomImage
    @Environment(AppState.self) private var root
    @State private var showSignInView = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()
                
                titleSection
                    .padding(.top, 24)
                
                ctaButtons
                    .padding(16)
                
                policyLinks
            }
        }
        .sheet(isPresented: $showSignInView) {
            CreateAccountView(
                title: "Sign In",
                subtitle: "Connect to an existing account.",
                onDidSignIn: { isNewUser in
                    handleDidSignIn(isNewUser: isNewUser)
                }
            )
                .presentationDetents([.height(300)])
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("AI Chat 💬")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("Github @tsomuk")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
    
    private var ctaButtons: some View {
        VStack(spacing: 8) {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get Started")
                    .callToActionButton()
            }
            
            Text("Alreagy have an account? Sign in!")
                .underline()
                .font(.body)
                .padding(8)
                .tappableBackground()
                .onTapGesture {
                    onSignInPressed()
                }
        }
    }
    
    private var policyLinks: some View {
        HStack(spacing: 8) {
            Link(destination: URL(string: Constants.privacyPolicyURL)!) {
                Text("Terms of Service")
            }
            
            Circle()
                .foregroundStyle(.accent)
                .frame(width: 4, height: 4)
            
            Link(destination: URL(string: Constants.termsOfServiceURL)!) {
                Text("Privacy Policy")
            }
        }
        
    }
    
    private func handleDidSignIn(isNewUser: Bool) {
        if isNewUser {
            // Do nothing, user goes through onboarding
        } else {
            root.updateViewState(showTabBarView: true)
        }
    }
    
    private func onSignInPressed() {
        showSignInView = true
    }
}

#Preview {
    WelcomeView()
}
