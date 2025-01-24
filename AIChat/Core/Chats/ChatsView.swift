//
//  ChatsView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var chats: [ChatModel] = ChatModel.mocks
    @State private var recentAvatars: [AvatarModel] = AvatarModel.mocks
    
    @State private var path: [NavigationPathOption] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                if !recentAvatars.isEmpty {
                    recentsSection
                }
                chatsSection
            }
            .navigationTitle("Chats")
            .navigationDestinationForCoreModule(path: $path)
        }
    }
    
    private var recentsSection: some View {
            Section {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 8) {
                        ForEach(recentAvatars, id: \.self) { avatar in
                            if let imageName = avatar.profileImageName {
                                VStack(spacing: 8) {
                                    ImageLoaderView(urlString: imageName)
                                        .aspectRatio(1, contentMode: .fit)
                                        .clipShape(.circle)
                                    Text(avatar.name ?? "")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                .anyButton(.press) {
                                    onAvatarPressed(avatar: avatar)
                                }
                            }
                        }
                    }
                    .padding(.top, 12)
                }
                .frame(height: 120)
                .scrollIndicators(.hidden)
                .removeListRowFormatting()
            } header: {
                Text("Recents")
            }
    }
    
    private var chatsSection: some View {
        Section {
            if chats.isEmpty {
                Text("Your chats will appear here!")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(40)
                    .removeListRowFormatting()
            } else {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        currentUserId: nil, // Add cuid
                        chat: chat,
                        getAvatar: {
                            try? await Task.sleep(for: .seconds(3))
                            return AvatarModel.mocks.randomElement()
                        },
                        getLastChatMessage: {
                            try? await Task.sleep(for: .seconds(3))
                            return ChatMessageModel.mocks.randomElement()
                        }
                        
                    )
                    .anyButton(.highlight, action: {
                        onChatPressed(chat: chat)
                    })
                    .removeListRowFormatting()
                }
            }
        } header: {
            Text("Chats")
        }
    }
    
    private func onChatPressed(chat: ChatModel) {
        path.append(.chat(avatarId: chat.avatarId))
    }
    
    private func onAvatarPressed(avatar: AvatarModel) {
        path.append(.chat(avatarId: avatar.avatarId))
    }
}

#Preview {
    NavigationStack {
        ChatsView()
    }
}
