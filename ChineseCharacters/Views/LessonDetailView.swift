import SwiftUI

enum PracticeMode {
    case pinyin
    case mixed
    case vietnamese
    case chineseCharacters
}

struct LessonDetailView: View {
    let lesson: Lesson
    @State private var showingPractice = false
    @State private var selectedMode: PracticeMode = .mixed
    @StateObject private var speechService = SpeechService()
    
    var body: some View {
        List {
            Section {
                ForEach(lesson.words) { word in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(word.character)
                                .font(.system(size: 32))
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            Button(action: {
                                speechService.speak(text: word.character)
                            }) {
                                Image(systemName: "speaker.wave.2.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 20))
                            }
                        }
                        
                        Text(word.pinyin)
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Text(word.vietnameseMeaning)
                            .font(.subheadline)
                        
                        Text(word.englishMeaning)
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    .padding(.vertical, 8)
                }
            }
        }
        .navigationTitle(lesson.title)
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: 12) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach([
                            (PracticeMode.mixed, "shuffle", "Mixed"),
                            (PracticeMode.pinyin, "textformat.abc", "Pinyin Only"),
                            (PracticeMode.vietnamese, "textformat.alt", "Vietnamese Only"),
                            (PracticeMode.chineseCharacters, "character.textbox", "Chinese Characters Only")
                        ], id: \.0) { mode, icon, title in
                            Button(action: {
                                selectedMode = mode
                            }) {
                                VStack(spacing: 8) {
                                    Image(systemName: icon)
                                        .font(.system(size: 24))
                                    Text(title)
                                        .font(.caption)
                                }
                                .frame(width: 100)
                                .padding(.vertical, 8)
                                .background(selectedMode == mode ? Color.blue.opacity(0.2) : Color.clear)
                                .foregroundColor(selectedMode == mode ? .blue : .primary)
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 8)
                
                // Practice button
                Button(action: {
                    showingPractice = true
                }) {
                    HStack {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 24))
                        Text("Start Practice")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding(.vertical, 12)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .ignoresSafeArea()
            )
        }
        .sheet(isPresented: $showingPractice) {
            PracticeView(lesson: lesson, mode: selectedMode)
        }
    }
}

#Preview {
    NavigationView {
        LessonDetailView(lesson: Lesson.sampleLessons[0])
    }
} 
