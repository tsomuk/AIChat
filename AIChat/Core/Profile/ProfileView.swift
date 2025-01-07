//
//  ProfileView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @State var showSetting: Bool = false
    @State var showCreateAvatar: Bool = false
    @State var isLoading: Bool = true
    @State var currentUser: UserModel? = .mock
    @State private var myAvatars: [AvatarModel] = []
    
    var body: some View {
        NavigationStack {
            List {
                myInfoSection
                myAvatarsSection
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    settingsButton
                }
            }
        }
        .task {
            await loadAvatars()
        }
        
        .sheet(isPresented: $showSetting) {
            SettingsView()
        }
        .fullScreenCover(isPresented: $showCreateAvatar) {
            CreateAvatarView()
        }
    }
    
    private var myInfoSection: some View {
        Section {
            ZStack {
                Circle()
                    .fill(currentUser?.profileColorCalculated ?? .accent)
            }
            .frame(width: 100)
            .frame(maxWidth: .infinity)
            .removeListRowFormatting()
        }
    }
    
    private var myAvatarsSection: some View {
        Section {
            if myAvatars.isEmpty {
                Group {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text("Click + to create an avatar")
                    }
                }
                .padding(50)
                .frame(maxWidth: .infinity)
                .font(.body)
                .foregroundStyle(.secondary)
                .removeListRowFormatting()
            } else {
                ForEach(myAvatars, id: \.self) { avatar in
                    CustomListCellView(
                        title: avatar.name,
                        subtitle: nil,
                        imageName: Constants.randomImage
                    )
                    .anyButton(.highlight, action: {
                        // add logic
                    })
                    .removeListRowFormatting()
                }
                .onDelete { indexSet in
                    onDeleteAvatar(indexSet: indexSet)
                }
            }
        } header: {
            HStack {
                Text("My avatars")
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                    .foregroundStyle(.accent)
                    .anyButton(.press) {
                        onPlusButtonPressed()
                    }
            }
        }
    }
    
    private var settingsButton: some View {
        Image(systemName: "gear")
            .font(.headline)
            .foregroundStyle(.accent)
            .anyButton { onSettingsButtonPressed() }
    }
    
    private func onSettingsButtonPressed() {
        showSetting = true
    }
    
    private func onPlusButtonPressed() {
        showCreateAvatar = true
    }
    
    private func onDeleteAvatar(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        myAvatars.remove(at: index)
    }
    
    private func loadAvatars() async {
        try? await Task.sleep(for: .seconds(3))
        isLoading = false
        myAvatars = AvatarModel.mocks
    }
}

#Preview {
    ProfileView()
        .environment(AppState())
}
