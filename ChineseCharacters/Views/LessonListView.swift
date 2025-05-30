import SwiftUI

struct LessonListView: View {
    @State private var selectedLesson: Lesson?
    
    var body: some View {
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
        .sheet(item: $selectedLesson) { lesson in
            LessonDetailView(lesson: lesson)
        }
    }
}

#Preview {
    LessonListView()
} 