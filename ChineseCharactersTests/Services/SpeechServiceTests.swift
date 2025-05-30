import XCTest
import AVFoundation
@testable import ChineseCharacters

final class SpeechServiceTests: XCTestCase {
    
    var speechService: SpeechService!
    
    override func setUpWithError() throws {
        speechService = SpeechService()
    }
    
    override func tearDownWithError() throws {
        speechService = nil
    }
    
    func testSpeechServiceInstances() {
        // Given/When
        let instance1 = SpeechService()
        let instance2 = SpeechService()
        
        // Then
        XCTAssertNotNil(instance1, "First SpeechService instance should be created")
        XCTAssertNotNil(instance2, "Second SpeechService instance should be created")
        XCTAssertFalse(instance1 === instance2, "SpeechService instances should be different")
    }
    
    func testSpeechServiceInitialization() {
        // Given/When
        let service = SpeechService()
        
        // Then
        XCTAssertNotNil(service, "SpeechService should initialize successfully")
    }
    
    func testSpeakMethodWithText() {
        // Given
        let testText = "你好"
        let expectation = XCTestExpectation(description: "Speech should be initiated")
        
        // When
        speechService.speak(text: testText)
        
        // Then - We can't easily test actual speech synthesis in unit tests,
        // but we can verify the method doesn't crash
        expectation.fulfill()
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testSpeakMethodWithGender() {
        // Given
        let testText = "你好"
        let gender = AVSpeechSynthesisVoiceGender.male
        let expectation = XCTestExpectation(description: "Speech with gender should be initiated")
        
        // When
        speechService.speak(text: testText, gender: gender)
        
        // Then - Verify method doesn't crash with gender parameter
        expectation.fulfill()
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testSpeakMethodWithEmptyText() {
        // Given
        let emptyText = ""
        let expectation = XCTestExpectation(description: "Empty text should be handled gracefully")
        
        // When
        speechService.speak(text: emptyText)
        
        // Then - Should handle empty text gracefully
        expectation.fulfill()
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testSpeakMethodWithChineseCharacters() {
        // Given
        let chineseTexts = [
            "你好",
            "谢谢",
            "早上好",
            "再见",
            "我学习汉语"
        ]
        
        // When/Then - All Chinese texts should be handled without crashing
        for text in chineseTexts {
            speechService.speak(text: text)
            // Small delay to avoid overwhelming the speech synthesizer
            Thread.sleep(forTimeInterval: 0.1)
        }
    }
    
    func testSpeakMethodWithPinyin() {
        // Given
        let pinyinTexts = [
            "nǐ hǎo",
            "xiè xiè",
            "zǎo shang hǎo",
            "zài jiàn"
        ]
        
        // When/Then - Pinyin text should be handled without crashing
        for text in pinyinTexts {
            speechService.speak(text: text)
            Thread.sleep(forTimeInterval: 0.1)
        }
    }
    
    func testSpeakMethodWithBothGenders() {
        // Given
        let testText = "你好世界"
        
        // When/Then - Both genders should work without crashing
        speechService.speak(text: testText, gender: .female)
        Thread.sleep(forTimeInterval: 0.2)
        
        speechService.speak(text: testText, gender: .male)
        Thread.sleep(forTimeInterval: 0.2)
    }
    
    func testSpeakMethodWithLongText() {
        // Given
        let longText = "我正在学习中文。这是一个很长的句子，用来测试语音合成服务是否能够处理较长的文本内容。"
        
        // When/Then - Long text should be handled without issues
        speechService.speak(text: longText)
    }
    
    func testSpeakMethodWithSpecialCharacters() {
        // Given
        let textWithPunctuation = "你好！我是小明。你叫什么名字？"
        
        // When/Then - Text with punctuation should be handled
        speechService.speak(text: textWithPunctuation)
    }
    
    func testMultipleConcurrentSpeechRequests() {
        // Given
        let texts = ["你好", "谢谢", "再见"]
        
        // When - Multiple rapid speech requests
        for text in texts {
            speechService.speak(text: text)
        }
        
        // Then - Should handle multiple requests gracefully (last one typically wins)
        // This test mainly ensures no crashes occur
    }
}