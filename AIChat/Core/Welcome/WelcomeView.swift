//
//  WelcomeView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var imageName = Constants.randomImage
    
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
                    print("sssss")
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
}

#Preview {
    WelcomeView()
}
