import SwiftUI

struct PracticeResult {
    let word: ChineseWord
    let userAnswer: String
    let correctAnswer: String
    let isCorrect: Bool
}

struct PracticeSummaryView: View {
    let results: [PracticeResult]
    let mode: PracticeMode
    @Environment(\.dismiss) private var dismiss
    
    private var correctCount: Int {
        results.filter { $0.isCorrect }.count
    }
    
    private var correctAnswers: [PracticeResult] {
        results.filter { $0.isCorrect }
    }
    
    private var incorrectAnswers: [PracticeResult] {
        results.filter { !$0.isCorrect }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Text("Final Score")
                            .font(.headline)
                        Spacer()
                        Text("\(correctCount)/\(results.count)")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                }
                
                if !incorrectAnswers.isEmpty {
                    Section("Incorrect Answers") {
                        ForEach(incorrectAnswers, id: \.word.character) { result in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text(result.word.character)
                                        .font(.title2)
                                    Spacer()
                                    Text(result.word.pinyin)
                                        .foregroundColor(.secondary)
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Your answer: \(result.userAnswer)")
                                        .foregroundColor(.red)
                                    Text("Correct: \(result.correctAnswer)")
                                        .foregroundColor(.green)
                                }
                                
                                if mode == .vietnamese {
                                    Text("Pinyin: \(result.word.pinyin)")
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                
                if !correctAnswers.isEmpty {
                    Section("Correct Answers") {
                        ForEach(correctAnswers, id: \.word.character) { result in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text(result.word.character)
                                        .font(.title2)
                                    Spacer()
                                    Text(result.word.pinyin)
                                        .foregroundColor(.secondary)
                                }
                                
                                Text("Answer: \(result.correctAnswer)")
                                    .foregroundColor(.green)
                                
                                if mode == .vietnamese {
                                    Text("Pinyin: \(result.word.pinyin)")
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Practice Summary")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
} 