//
//  ChatView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 07.01.2025.
//

import SwiftUI

struct ChatView: View {
    
    @State private var chatMessages: [ChatMessageModel] = ChatMessageModel.mocks
    @State private var avatar: AvatarModel = .mock
    @State private var currentUser: UserModel = .mock
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(chatMessages) { message in
                        let isCurrentUser = message.authorId == currentUser.userId
                        ChatBubbleViewBuilder(
                            message: message,
                            isCurrentUser: isCurrentUser,
                            imageName: isCurrentUser ? nil : avatar.profileImageName
                        )
                    }
                }
                .frame(maxWidth: .infinity)
            }
            Rectangle()
                .frame(height: 50)
        }
        .padding(8)
        .navigationTitle(avatar.name ?? "Chat")
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
