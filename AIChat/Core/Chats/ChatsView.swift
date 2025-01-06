//
//  ChatsView.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 02.01.2025.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var chats: [ChatModel] = ChatModel.mocks
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        currentUserId: nil, // Add cuid
                        chat: chat,
                    getAvatar: {
                        try? await Task.sleep(for: .seconds(3))
                        return .mock
                    },
                    getLastChatMessage: {
                        try? await Task.sleep(for: .seconds(3))
                        return .mock
                    }
                    
                    )
                    .anyButton(.highlight, action: {
                          
                    })
                    .removeListRowFormatting()
                }
            }
            .navigationTitle("Chats")
        }
    }
}

#Preview {
    NavigationStack {
        ChatsView()
    }
}
