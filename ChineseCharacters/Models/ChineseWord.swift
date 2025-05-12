import Foundation

struct ChineseWord: Identifiable, Equatable {
    let id = UUID()
    let character: String
    let pinyin: String
    let vietnameseMeaning: String
    let englishMeaning: String
    let chineseExample: String?
    let vietnameseExample: String?
    
    init(character: String, pinyin: String, vietnameseMeaning: String, englishMeaning: String, 
         chineseExample: String? = nil, vietnameseExample: String? = nil) {
        self.character = character
        self.pinyin = pinyin
        self.vietnameseMeaning = vietnameseMeaning
        self.englishMeaning = englishMeaning
        self.chineseExample = chineseExample
        self.vietnameseExample = vietnameseExample
    }
} 