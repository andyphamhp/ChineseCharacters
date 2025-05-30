import XCTest
@testable import ChineseCharacters

final class LessonTests: XCTestCase {
    
    func testLessonInitialization() {
        // Given
        let number = 1
        let title = "Test Lesson"
        let words = [
            ChineseWord(character: "你好", pinyin: "nǐ hǎo", vietnameseMeaning: "Xin chào", englishMeaning: "Hello"),
            ChineseWord(character: "谢谢", pinyin: "xiè xiè", vietnameseMeaning: "Cảm ơn", englishMeaning: "Thank you")
        ]
        
        // When
        let lesson = Lesson(number: number, title: title, words: words)
        
        // Then
        XCTAssertEqual(lesson.number, number)
        XCTAssertEqual(lesson.title, title)
        XCTAssertEqual(lesson.words.count, 2)
        XCTAssertEqual(lesson.words[0].character, "你好")
        XCTAssertEqual(lesson.words[1].character, "谢谢")
        XCTAssertNotNil(lesson.id)
    }
    
    func testLessonEmptyWords() {
        // Given
        let number = 1
        let title = "Empty Lesson"
        let words: [ChineseWord] = []
        
        // When
        let lesson = Lesson(number: number, title: title, words: words)
        
        // Then
        XCTAssertEqual(lesson.number, number)
        XCTAssertEqual(lesson.title, title)
        XCTAssertEqual(lesson.words.count, 0)
        XCTAssertTrue(lesson.words.isEmpty)
    }
    
    func testSampleLessonsExist() {
        // Given/When
        let sampleLessons = Lesson.sampleLessons
        
        // Then
        XCTAssertFalse(sampleLessons.isEmpty, "Sample lessons should not be empty")
        XCTAssertEqual(sampleLessons.count, 11, "Should have 11 sample lessons")
        
        // Test first lesson
        let firstLesson = sampleLessons[0]
        XCTAssertEqual(firstLesson.number, 1)
        XCTAssertEqual(firstLesson.title, "你好 - Xin chào")
        XCTAssertFalse(firstLesson.words.isEmpty, "First lesson should have words")
        
        // Test last lesson
        let lastLesson = sampleLessons[10]
        XCTAssertEqual(lastLesson.number, 11)
        XCTAssertEqual(lastLesson.title, "我们都是留学生 - Chúng tôi đều là lưu học sinh")
        XCTAssertFalse(lastLesson.words.isEmpty, "Last lesson should have words")
    }
    
    func testSampleLessonsProgression() {
        // Given
        let sampleLessons = Lesson.sampleLessons
        
        // When/Then - Test that lesson numbers are in sequence
        for (index, lesson) in sampleLessons.enumerated() {
            XCTAssertEqual(lesson.number, index + 1, "Lesson number should match array index + 1")
        }
    }
    
    func testSampleLessonsHaveContent() {
        // Given
        let sampleLessons = Lesson.sampleLessons
        
        // When/Then - All lessons should have content
        for lesson in sampleLessons {
            XCTAssertFalse(lesson.words.isEmpty, "Lesson \(lesson.number) should have words")
            XCTAssertFalse(lesson.title.isEmpty, "Lesson \(lesson.number) should have a title")
            
            // Test that all words have required content
            for word in lesson.words {
                XCTAssertFalse(word.character.isEmpty, "Word character should not be empty")
                XCTAssertFalse(word.pinyin.isEmpty, "Word pinyin should not be empty")
                XCTAssertFalse(word.vietnameseMeaning.isEmpty, "Word Vietnamese meaning should not be empty")
                XCTAssertFalse(word.englishMeaning.isEmpty, "Word English meaning should not be empty")
            }
        }
    }
    
    func testLessonVocabularyProgression() {
        // Given
        let sampleLessons = Lesson.sampleLessons
        
        // When/Then - Later lessons should generally have more vocabulary
        let firstLessonWordCount = sampleLessons[0].words.count
        let lastLessonWordCount = sampleLessons[10].words.count
        
        XCTAssertGreaterThan(firstLessonWordCount, 0, "First lesson should have words")
        XCTAssertGreaterThan(lastLessonWordCount, 0, "Last lesson should have words")
        
        // Test total vocabulary across all lessons
        let totalWords = sampleLessons.flatMap { $0.words }.count
        XCTAssertGreaterThan(totalWords, 200, "Should have substantial vocabulary across all lessons")
    }
}