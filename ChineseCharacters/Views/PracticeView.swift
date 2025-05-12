import SwiftUI

enum PracticeType {
    case meaning
    case pinyin
    case english
    case writeCharacter
}

// MARK: - Word Display View
struct WordDisplayView: View {
    let word: ChineseWord
    let practiceType: PracticeType
    let mode: PracticeMode
    let speechService: SpeechService
    
    var body: some View {
        if practiceType == .writeCharacter {
            VStack(spacing: 12) {
                Text(word.vietnameseMeaning)
                    .font(.title2)
                    .foregroundColor(.primary)
                
                if mode != .chineseCharacters {
                    Text(word.pinyin)
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
        } else {
            HStack {
                Text(word.character)
                    .font(.system(size: 48))
                    .padding()
                
                Button(action: {
                    speechService.speak(text: word.character)
                }) {
                    Image(systemName: "speaker.wave.2.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 24))
                }
            }
        }
    }
}

// MARK: - Feedback View
struct FeedbackView: View {
    let isCorrect: Bool
    let correctAnswer: String
    let word: ChineseWord
    let practiceType: PracticeType
    let mode: PracticeMode
    let speechService: SpeechService
    
    var body: some View {
        VStack(spacing: 8) {
            Text(isCorrect ? "Correct! 🎉" : "Incorrect. Try again.")
                .foregroundColor(isCorrect ? .green : .red)
                .font(.headline)
            
            if practiceType == .writeCharacter {
                HStack {
                    Text("Correct: ")
                    Text(correctAnswer)
                        .font(.system(size: 32))
                }
                .foregroundColor(.secondary)
            } else {
                Text("Correct answer: \(correctAnswer)")
                    .foregroundColor(.secondary)
            }
            
            Text("Pinyin: \(word.pinyin)")
                .foregroundColor(.secondary)
            
            if mode == .chineseCharacters {
                Text("English: \(word.englishMeaning)")
                    .foregroundColor(.secondary)
            }
            
            if let chineseExample = word.chineseExample, let vietnameseExample = word.vietnameseExample {
                VStack(alignment: .center, spacing: 4) {
                    HStack {
                        Spacer()
                        Text("Example: \(chineseExample)")
                            .foregroundColor(.secondary)
                        Button(action: {
                            speechService.speak(text: chineseExample)
                        }) {
                            Image(systemName: "speaker.wave.2.fill")
                                .foregroundColor(.blue)
                                .font(.system(size: 16))
                        }
                        Spacer()
                    }
                    Text("\(vietnameseExample)")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
            }
        }
        .transition(.opacity)
    }
}

// MARK: - Main Practice View
struct PracticeView: View {
    let lesson: Lesson
    let mode: PracticeMode
    @Environment(\.dismiss) private var dismiss
    @StateObject private var speechService = SpeechService()
    @StateObject private var soundService = SoundService()
    @State private var currentWordIndex = 0
    @State private var userAnswer = ""
    @State private var showingFeedback = false
    @State private var isCorrect = false
    @State private var correctCount = 0
    @State private var practiceType: PracticeType = .pinyin
    @State private var randomizedIndices: [Int] = []
    @FocusState private var isAnswerFocused: Bool
    
    private var currentWord: ChineseWord? {
        guard !randomizedIndices.isEmpty && currentWordIndex < randomizedIndices.count else {
            return nil
        }
        return lesson.words[randomizedIndices[currentWordIndex]]
    }
    
    private var correctAnswer: String {
        guard let word = currentWord else { return "" }
        switch practiceType {
        case .meaning:
            return word.vietnameseMeaning
        case .pinyin:
            return word.pinyin
        case .english:
            return word.englishMeaning
        case .writeCharacter:
            return word.character
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
        case .writeCharacter:
            return "Write the Chinese character:"
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Progress
                Text("\(currentWordIndex + 1) of \(lesson.words.count)")
                    .font(.headline)
                
                if let word = currentWord {
                    // Word Display
                    WordDisplayView(word: word, practiceType: practiceType, mode: mode, speechService: speechService)
                    
                    Text(questionText)
                        .font(.headline)
                    
                    // Answer input
                    TextField("Your answer", text: $userAnswer)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .disabled(showingFeedback)
                        .focused($isAnswerFocused)
                    
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
                        FeedbackView(isCorrect: isCorrect, correctAnswer: correctAnswer, word: word, practiceType: practiceType, mode: mode, speechService: speechService)
                    }
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
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
            .onAppear {
                initializePractice()
            }
            .onChange(of: showingFeedback, { oldValue, newValue in
                if !newValue {
                    isAnswerFocused = true
                }
            })
            .animation(.easeInOut, value: showingFeedback)
        }
    }
    
    private func initializePractice() {
        randomizedIndices = Array(0..<lesson.words.count).shuffled()
        switch mode {
        case .pinyin:
            practiceType = .pinyin
        case .vietnamese:
            practiceType = .meaning
        case .chineseCharacters:
            practiceType = .writeCharacter
        case .mixed:
            practiceType = [.meaning, .pinyin, .english, .writeCharacter].randomElement()!
        }
        isAnswerFocused = true
    }
    
    private func checkAnswer() {
        if showingFeedback {
            handleNextQuestion()
        } else {
            evaluateAnswer()
        }
    }
    
    private func handleNextQuestion() {
        if currentWordIndex < lesson.words.count - 1 {
            withAnimation {
                currentWordIndex += 1
                userAnswer = ""
                showingFeedback = false
                switch mode {
                case .pinyin:
                    practiceType = .pinyin
                case .vietnamese:
                    practiceType = .meaning
                case .chineseCharacters:
                    practiceType = .writeCharacter
                case .mixed:
                    practiceType = [.meaning, .pinyin, .english, .writeCharacter].randomElement()!
                }
            }
        } else {
            dismiss()
        }
    }
    
    private func evaluateAnswer() {
        let correctAnswer = correctAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        let userAnswerLowered = userAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        let correctParts = correctAnswer.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        isCorrect = correctParts.contains { $0 == userAnswerLowered }
        
        if isCorrect {
            correctCount += 1
            soundService.playCorrectSound()
        }
        
        withAnimation {
            showingFeedback = true
        }
        
        if (mode == .vietnamese || mode == .chineseCharacters), let word = currentWord {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                speechService.speak(text: word.character)
            }
        }
    }
}

#Preview {
    PracticeView(lesson: Lesson.sampleLessons[0], mode: .pinyin)
} 
