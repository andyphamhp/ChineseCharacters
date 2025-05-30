import SwiftUI

struct ConversationDetailView: View {
    let conversation: Conversation
    @StateObject private var speechService = SpeechService()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(conversation.dialogue) { line in
                    DialogueLineView(line: line, speechService: speechService)
                }
            }
            .padding()
        }
        .navigationTitle("\(conversation.title)")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct DialogueLineView: View {
    let line: DialogueLine
    let speechService: SpeechService
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Text(line.speaker)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(line.chinese)
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    Button(action: {
                        speechService.speak(text: line.chinese)
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .foregroundColor(.blue)
                            .font(.body)
                    }
                }
                
                Text(line.pinyin)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Text(line.english)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .italic()
            }
            
            Spacer()
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.05))
        )
        .padding(.vertical, 5)
    }
}