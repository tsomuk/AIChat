//
//  ChatBubbleViewBuilder.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 12.01.2025.
//

import SwiftUI

struct ChatBubbleViewBuilder: View {
    
    var message: ChatMessageModel = .mock
    var isCurrentUser: Bool = false
    var imageName: String?

    var body: some View {
        ZStack {
            ChatBubbleView(
                text: message.content ?? "",
                textColor: isCurrentUser ? .white : .primary,
                backgroundColor: isCurrentUser ? .accent : Color(uiColor: .systemGray6),
                showImage: !isCurrentUser,
                imageName: imageName
            )
            .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
            .padding(.leading, isCurrentUser ? 70 : 0)
            .padding(.trailing, isCurrentUser ? 0 : 70)
        }
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 24) {
            ChatBubbleViewBuilder()
            ChatBubbleViewBuilder(isCurrentUser: true)
            ChatBubbleViewBuilder(imageName: Constants.randomImage)
            ChatBubbleViewBuilder(imageName: Constants.randomImage)
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "This is some longer content that goes on multiple lines and keeps on going till the end of the screen",
                    seenByIds: nil,
                    dateCreated: .now
                ), imageName: Constants.randomImage
            )
            
            ChatBubbleViewBuilder(
                
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "This is some longer content that goes on multiple lines and keeps on going till the end of the screen",
                    seenByIds: nil,
                    dateCreated: .now
                ),
                isCurrentUser: true
            )
        }
    }
    .padding()
}
