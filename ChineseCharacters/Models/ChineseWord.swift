import Foundation

struct ChineseWord: Identifiable {
    let id = UUID()
    let character: String
    let pinyin: String
    let vietnameseMeaning: String
    let englishMeaning: String
    let example: String?
    
    init(character: String, pinyin: String, vietnameseMeaning: String, englishMeaning: String, 
         example: String? = nil) {
        self.character = character
        self.pinyin = pinyin
        self.vietnameseMeaning = vietnameseMeaning
        self.englishMeaning = englishMeaning
        self.example = example
    }
} 