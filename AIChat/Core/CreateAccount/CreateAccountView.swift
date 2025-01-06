//
//  CreateAccountView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 06.01.2025.
//

import SwiftUI

struct CreateAccountView: View {
    
    var title: String = "Create Account?"
    var subtitle: String = "Don't lose your data! Connect to an SSO provider to save your account."
    
    var body: some View {
        VStack(spacing: 24) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 30, height: 3)
                .foregroundStyle(.secondary.opacity(0.5))
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.body)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 40)
            
            SignInWithAppleButtonView(
                type: .signIn,
                style: .black, cornerRadius: 10)
            .frame(height: 55)
            .anyButton(.press) {}
            
            Spacer()
        }
        .padding(16)
    }
}

#Preview {
    CreateAccountView()
}
