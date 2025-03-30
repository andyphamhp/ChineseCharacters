import SwiftUI

struct LessonListView: View {
    @State private var selectedLesson: Lesson?
    @State private var showingSettings = false
    
    var body: some View {
        NavigationView {
            List(Lesson.sampleLessons) { lesson in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Bài \(lesson.number)")
                            .font(.headline)
                            .foregroundColor(.blue)
                        Spacer()
                        Text("\(lesson.words.count) từ")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Text(lesson.title)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                .padding(.vertical, 4)
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedLesson = lesson
                }
            }
            .navigationTitle("Học tiếng Trung")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingSettings = true
                    }) {
                        Image(systemName: "gear")
                    }
                }
            }
            .sheet(isPresented: $showingSettings) {
                SettingsView()
            }
            .sheet(item: $selectedLesson) { lesson in
                LessonDetailView(lesson: lesson)
            }
        }
    }
}

#Preview {
    LessonListView()
} 