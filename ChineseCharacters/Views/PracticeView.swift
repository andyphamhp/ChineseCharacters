import SwiftUI

enum PracticeType {
    case meaning
    case pinyin
    case english
}

struct PracticeView: View {
    let lesson: Lesson
    @Environment(\.dismiss) private var dismiss
    @StateObject private var speechService = SpeechService()
    @StateObject private var soundService = SoundService()
    @State private var currentWordIndex = 0
    @State private var userAnswer = ""
    @State private var showingFeedback = false
    @State private var isCorrect = false
    @State private var correctCount = 0
    @State private var practiceType: PracticeType = [.meaning, .pinyin, .english].randomElement()!
    @State private var showingPracticeComplete = false
    
    private var currentWord: ChineseWord {
        lesson.words[currentWordIndex]
    }
    
    private var correctAnswer: String {
        switch practiceType {
        case .meaning:
            return currentWord.vietnameseMeaning
        case .pinyin:
            return currentWord.pinyin
        case .english:
            return currentWord.englishMeaning
        }
    }
    
    private var questionText: String {
        switch practiceType {
        case .meaning:
            return "Enter the Vietnamese meaning:"
        case .pinyin:
            return "Enter the pinyin:"
        case .english:
            return "Enter the English meaning:"
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Progress
                Text("\(currentWordIndex + 1) of \(lesson.words.count)")
                    .font(.headline)
                
                // Question
                HStack {
                    Text(currentWord.character)
                        .font(.system(size: 48))
                        .padding()
                    
                    Button(action: {
                        speechService.speak(text: currentWord.character)
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 24))
                    }
                }
                
                Text(questionText)
                    .font(.headline)
                
                // Answer input
                TextField("Your answer", text: $userAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .disabled(showingFeedback)
                
                // Submit button
                Button(action: checkAnswer) {
                    Text(showingFeedback ? "Next" : "Submit")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .disabled(showingFeedback && currentWordIndex == lesson.words.count - 1)
                
                // Feedback
                if showingFeedback {
                    Text(isCorrect ? "Correct! 🎉" : "Incorrect. Try again.")
                        .foregroundColor(isCorrect ? .green : .red)
                        .font(.headline)
                    
                    if !isCorrect {
                        Text("Correct answer: \(correctAnswer)")
                            .foregroundColor(.secondary)
                    }
                }
                
                // Score
                Text("Score: \(correctCount)/\(currentWordIndex + 1)")
                    .font(.headline)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Practice")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            .alert("Practice Complete!", isPresented: $showingPracticeComplete) {
                Button("OK") {
                    // Reset practice
                    currentWordIndex = 0
                    correctCount = 0
                    userAnswer = ""
                    showingFeedback = false
                }
            } message: {
                Text("Your final score: \(correctCount)/\(lesson.words.count)")
            }
        }
    }
    
    private func checkAnswer() {
        if showingFeedback {
            if currentWordIndex < lesson.words.count - 1 {
                currentWordIndex += 1
                userAnswer = ""
                showingFeedback = false
                practiceType = [.meaning, .pinyin, .english].randomElement()!
            } else {
                showingPracticeComplete = true
            }
        } else {
            let correctAnswer = correctAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            let userAnswerLowered = userAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            
            isCorrect = correctAnswer == userAnswerLowered
            
            if isCorrect {
                correctCount += 1
                soundService.playCorrectSound()
                
                // Move to next word after a short delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    if currentWordIndex < lesson.words.count - 1 {
                        currentWordIndex += 1
                        userAnswer = ""
                        showingFeedback = false
                    } else {
                        showingPracticeComplete = true
                    }
                }
            }
            
            showingFeedback = true
        }
    }
}

#Preview {
    PracticeView(lesson: Lesson.sampleLessons[0])
} 