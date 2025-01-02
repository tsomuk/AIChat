//
//  ProfileView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @State var showSetting: Bool = false
    
    var body: some View {
        NavigationStack {
            Text("Profile")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        settingsButton

                    }
                }
        }
        .sheet(isPresented: $showSetting) {
            Text("Setting")
        }
    }
    
    private var settingsButton: some View {
        Button {
            onSettingsButtonPressed()
        } label: {
            Image(systemName: "gear")
                .font(.headline)
        }
    }
    
    private func onSettingsButtonPressed() {
        showSetting = true
    }
    
}

#Preview {
    ProfileView()
}
