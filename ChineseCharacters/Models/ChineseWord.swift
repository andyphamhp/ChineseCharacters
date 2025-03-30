import Foundation

struct ChineseWord: Identifiable {
    let id = UUID()
    let character: String
    let pinyin: String
    let vietnameseMeaning: String
    let englishMeaning: String
} 