import SwiftUI

struct LessonDetailView: View {
    let lesson: Lesson
    @State private var showingPractice = false
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
            
            Section {
                Button(action: {
                    showingPractice = true
                }) {
                    HStack {
                        Image(systemName: "play.circle.fill")
                        Text("Start Practice")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .listRowInsets(EdgeInsets())
                .padding()
            }
        }
        .navigationTitle(lesson.title)
        .sheet(isPresented: $showingPractice) {
            PracticeView(lesson: lesson)
        }
    }
}

#Preview {
    NavigationView {
        LessonDetailView(lesson: Lesson.sampleLessons[0])
    }
} 