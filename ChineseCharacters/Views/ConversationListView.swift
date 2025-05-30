import SwiftUI

struct ConversationListView: View {
    let conversations = Conversation.sampleConversations
    
    var body: some View {
        List(conversations) { conversation in
            NavigationLink(destination: ConversationDetailView(conversation: conversation)) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("对话 \(conversation.number): \(conversation.title)")
                        .font(.headline)
                    Text(conversation.titlePinyin)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(conversation.titleEnglish)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 5)
            }
        }
        .navigationTitle("对话 - Conversations")
    }
}