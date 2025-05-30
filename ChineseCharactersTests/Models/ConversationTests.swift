import XCTest
@testable import ChineseCharacters

final class ConversationTests: XCTestCase {
    
    func testDialogueLineInitialization() {
        // Given
        let speaker = "A"
        let chinese = "你好！"
        let pinyin = "Nǐ hǎo!"
        let english = "Hello!"
        
        // When
        let dialogueLine = DialogueLine(
            speaker: speaker,
            chinese: chinese,
            pinyin: pinyin,
            english: english
        )
        
        // Then
        XCTAssertEqual(dialogueLine.speaker, speaker)
        XCTAssertEqual(dialogueLine.chinese, chinese)
        XCTAssertEqual(dialogueLine.pinyin, pinyin)
        XCTAssertEqual(dialogueLine.english, english)
        XCTAssertNotNil(dialogueLine.id)
    }
    
    func testConversationInitialization() {
        // Given
        let number = 1
        let title = "测试对话"
        let titlePinyin = "Cèshì duìhuà"
        let titleEnglish = "Test Conversation"
        let dialogue = [
            DialogueLine(speaker: "A", chinese: "你好！", pinyin: "Nǐ hǎo!", english: "Hello!"),
            DialogueLine(speaker: "B", chinese: "你好！", pinyin: "Nǐ hǎo!", english: "Hello!")
        ]
        
        // When
        let conversation = Conversation(
            number: number,
            title: title,
            titlePinyin: titlePinyin,
            titleEnglish: titleEnglish,
            dialogue: dialogue
        )
        
        // Then
        XCTAssertEqual(conversation.number, number)
        XCTAssertEqual(conversation.title, title)
        XCTAssertEqual(conversation.titlePinyin, titlePinyin)
        XCTAssertEqual(conversation.titleEnglish, titleEnglish)
        XCTAssertEqual(conversation.dialogue.count, 2)
        XCTAssertNotNil(conversation.id)
    }
    
    func testSampleConversationsExist() {
        // Given/When
        let sampleConversations = Conversation.sampleConversations
        
        // Then
        XCTAssertFalse(sampleConversations.isEmpty, "Sample conversations should not be empty")
        XCTAssertEqual(sampleConversations.count, 11, "Should have 11 sample conversations")
        
        // Test first conversation
        let firstConversation = sampleConversations[0]
        XCTAssertEqual(firstConversation.number, 1)
        XCTAssertEqual(firstConversation.title, "第一次见面")
        XCTAssertEqual(firstConversation.titlePinyin, "Dì yī cì jiànmiàn")
        XCTAssertEqual(firstConversation.titleEnglish, "First Meeting")
        XCTAssertFalse(firstConversation.dialogue.isEmpty, "First conversation should have dialogue")
        
        // Test last conversation
        let lastConversation = sampleConversations[10]
        XCTAssertEqual(lastConversation.number, 11)
        XCTAssertEqual(lastConversation.title, "新同学")
        XCTAssertEqual(lastConversation.titlePinyin, "Xīn tóngxué")
        XCTAssertEqual(lastConversation.titleEnglish, "New Classmates")
        XCTAssertFalse(lastConversation.dialogue.isEmpty, "Last conversation should have dialogue")
    }
    
    func testSampleConversationsProgression() {
        // Given
        let sampleConversations = Conversation.sampleConversations
        
        // When/Then - Test that conversation numbers are in sequence
        for (index, conversation) in sampleConversations.enumerated() {
            XCTAssertEqual(conversation.number, index + 1, "Conversation number should match array index + 1")
        }
    }
    
    func testSampleConversationsHaveContent() {
        // Given
        let sampleConversations = Conversation.sampleConversations
        
        // When/Then - All conversations should have content
        for conversation in sampleConversations {
            XCTAssertFalse(conversation.dialogue.isEmpty, "Conversation \(conversation.number) should have dialogue")
            XCTAssertFalse(conversation.title.isEmpty, "Conversation \(conversation.number) should have a title")
            XCTAssertFalse(conversation.titlePinyin.isEmpty, "Conversation \(conversation.number) should have pinyin title")
            XCTAssertFalse(conversation.titleEnglish.isEmpty, "Conversation \(conversation.number) should have English title")
            
            // Test that all dialogue lines have required content
            for dialogueLine in conversation.dialogue {
                XCTAssertFalse(dialogueLine.speaker.isEmpty, "Dialogue speaker should not be empty")
                XCTAssertFalse(dialogueLine.chinese.isEmpty, "Dialogue Chinese should not be empty")
                XCTAssertFalse(dialogueLine.pinyin.isEmpty, "Dialogue pinyin should not be empty")
                XCTAssertFalse(dialogueLine.english.isEmpty, "Dialogue English should not be empty")
            }
        }
    }
    
    func testConversationDialogueLength() {
        // Given
        let sampleConversations = Conversation.sampleConversations
        
        // When/Then - Conversations should have reasonable dialogue length
        for conversation in sampleConversations {
            XCTAssertGreaterThanOrEqual(conversation.dialogue.count, 2, "Conversation should have at least 2 dialogue lines")
            XCTAssertLessThanOrEqual(conversation.dialogue.count, 15, "Conversation should not be overly long")
        }
    }
    
    func testDialogueLineUniqueIDs() {
        // Given
        let line1 = DialogueLine(speaker: "A", chinese: "你好！", pinyin: "Nǐ hǎo!", english: "Hello!")
        let line2 = DialogueLine(speaker: "A", chinese: "你好！", pinyin: "Nǐ hǎo!", english: "Hello!")
        
        // Then - IDs should be different even if content is same
        XCTAssertNotEqual(line1.id, line2.id)
    }
    
    func testConversationUniqueIDs() {
        // Given
        let dialogue = [
            DialogueLine(speaker: "A", chinese: "你好！", pinyin: "Nǐ hǎo!", english: "Hello!")
        ]
        
        let conversation1 = Conversation(
            number: 1,
            title: "测试",
            titlePinyin: "Cèshì",
            titleEnglish: "Test",
            dialogue: dialogue
        )
        
        let conversation2 = Conversation(
            number: 1,
            title: "测试",
            titlePinyin: "Cèshì",
            titleEnglish: "Test",
            dialogue: dialogue
        )
        
        // Then - IDs should be different even if content is same
        XCTAssertNotEqual(conversation1.id, conversation2.id)
    }
}