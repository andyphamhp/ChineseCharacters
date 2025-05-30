import XCTest
@testable import ChineseCharacters

final class ChineseWordTests: XCTestCase {
    
    func testChineseWordInitialization() {
        // Given
        let character = "你好"
        let pinyin = "nǐ hǎo"
        let vietnameseMeaning = "Xin chào"
        let englishMeaning = "Hello"
        let chineseExample = "你好，我是小明"
        let vietnameseExample = "Xin chào, tôi là Tiểu Minh"
        
        // When
        let word = ChineseWord(
            character: character,
            pinyin: pinyin,
            vietnameseMeaning: vietnameseMeaning,
            englishMeaning: englishMeaning,
            chineseExample: chineseExample,
            vietnameseExample: vietnameseExample
        )
        
        // Then
        XCTAssertEqual(word.character, character)
        XCTAssertEqual(word.pinyin, pinyin)
        XCTAssertEqual(word.vietnameseMeaning, vietnameseMeaning)
        XCTAssertEqual(word.englishMeaning, englishMeaning)
        XCTAssertEqual(word.chineseExample, chineseExample)
        XCTAssertEqual(word.vietnameseExample, vietnameseExample)
        XCTAssertNotNil(word.id)
    }
    
    func testChineseWordInitializationWithoutExamples() {
        // Given
        let character = "谢谢"
        let pinyin = "xiè xiè"
        let vietnameseMeaning = "Cảm ơn"
        let englishMeaning = "Thank you"
        
        // When
        let word = ChineseWord(
            character: character,
            pinyin: pinyin,
            vietnameseMeaning: vietnameseMeaning,
            englishMeaning: englishMeaning
        )
        
        // Then
        XCTAssertEqual(word.character, character)
        XCTAssertEqual(word.pinyin, pinyin)
        XCTAssertEqual(word.vietnameseMeaning, vietnameseMeaning)
        XCTAssertEqual(word.englishMeaning, englishMeaning)
        XCTAssertNil(word.chineseExample)
        XCTAssertNil(word.vietnameseExample)
    }
    
    func testChineseWordEquality() {
        // Given
        let word1 = ChineseWord(
            character: "你好",
            pinyin: "nǐ hǎo",
            vietnameseMeaning: "Xin chào",
            englishMeaning: "Hello"
        )
        
        let word2 = ChineseWord(
            character: "你好",
            pinyin: "nǐ hǎo",
            vietnameseMeaning: "Xin chào",
            englishMeaning: "Hello"
        )
        
        let word3 = ChineseWord(
            character: "再见",
            pinyin: "zài jiàn",
            vietnameseMeaning: "Tạm biệt",
            englishMeaning: "Goodbye"
        )
        
        // Then - ChineseWord uses Equatable based on content, not ID
        XCTAssertEqual(word1.character, word2.character, "Characters should be equal")
        XCTAssertEqual(word1.pinyin, word2.pinyin, "Pinyin should be equal")
        XCTAssertEqual(word1.vietnameseMeaning, word2.vietnameseMeaning, "Vietnamese meanings should be equal")
        XCTAssertEqual(word1.englishMeaning, word2.englishMeaning, "English meanings should be equal")
        
        // Test content-based equality
        XCTAssertEqual(word1, word2, "Words with same content should be equal")
        XCTAssertNotEqual(word1, word3, "Words with different content should not be equal")
        XCTAssertNotEqual(word2, word3, "Words with different content should not be equal")
    }
    
    func testChineseWordUniqueIDs() {
        // Given
        let word1 = ChineseWord(
            character: "你好",
            pinyin: "nǐ hǎo",
            vietnameseMeaning: "Xin chào",
            englishMeaning: "Hello"
        )
        
        let word2 = ChineseWord(
            character: "你好",
            pinyin: "nǐ hǎo",
            vietnameseMeaning: "Xin chào",
            englishMeaning: "Hello"
        )
        
        // Then - IDs should be different even if content is same
        XCTAssertNotEqual(word1.id, word2.id)
    }
}