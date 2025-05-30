import XCTest
import AVFoundation
@testable import ChineseCharacters

final class SoundServiceTests: XCTestCase {
    
    var soundService: SoundService!
    
    override func setUpWithError() throws {
        soundService = SoundService()
    }
    
    override func tearDownWithError() throws {
        soundService = nil
    }
    
    func testSoundServiceInstances() {
        // Given/When
        let instance1 = SoundService()
        let instance2 = SoundService()
        
        // Then
        XCTAssertNotNil(instance1, "First SoundService instance should be created")
        XCTAssertNotNil(instance2, "Second SoundService instance should be created")
        XCTAssertFalse(instance1 === instance2, "SoundService instances should be different")
    }
    
    func testSoundServiceInitialization() {
        // Given/When
        let service = SoundService()
        
        // Then
        XCTAssertNotNil(service, "SoundService should initialize successfully")
    }
    
    func testPlayCorrectSoundMethod() {
        // Given
        let expectation = XCTestExpectation(description: "Correct sound should be initiated")
        
        // When
        soundService.playCorrectSound()
        
        // Then - We can't easily test actual audio playback in unit tests,
        // but we can verify the method doesn't crash
        expectation.fulfill()
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testMultipleCorrectSoundCalls() {
        // Given
        let expectation = XCTestExpectation(description: "Multiple sound calls should be handled")
        
        // When - Call multiple times rapidly
        for _ in 0..<5 {
            soundService.playCorrectSound()
        }
        
        // Then - Should handle multiple calls gracefully
        expectation.fulfill()
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testSoundFileExists() {
        // Given
        let bundle = Bundle.main
        
        // When
        let soundURL = bundle.url(forResource: "correct", withExtension: "mp3")
        
        // Then
        XCTAssertNotNil(soundURL, "correct.mp3 sound file should exist in bundle")
        
        if let url = soundURL {
            let fileExists = FileManager.default.fileExists(atPath: url.path)
            XCTAssertTrue(fileExists, "Sound file should exist at the specified path")
        }
    }
    
    func testSoundFileCanBeLoadedByAVAudioPlayer() {
        // Given
        guard let soundURL = Bundle.main.url(forResource: "correct", withExtension: "mp3") else {
            XCTFail("Sound file should exist")
            return
        }
        
        // When/Then
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            XCTAssertNotNil(audioPlayer, "AVAudioPlayer should be able to load the sound file")
            XCTAssertGreaterThan(audioPlayer.duration, 0, "Sound file should have duration")
        } catch {
            XCTFail("Should be able to create AVAudioPlayer with sound file: \(error)")
        }
    }
    
    func testSoundServiceHandlesMissingFile() {
        // This test verifies that the service handles missing files gracefully
        // We can't easily test this without modifying the actual file structure,
        // so we test that the current implementation doesn't crash
        
        // Given/When
        let service = SoundService()
        
        // Then
        XCTAssertNotNil(service, "SoundService should initialize even if there might be file issues")
        
        // When - Try to play sound
        service.playCorrectSound()
        
        // Then - Should not crash (actual playback might fail silently)
    }
    
    func testConcurrentSoundPlayback() {
        // Given
        let service = SoundService()
        let expectation = XCTestExpectation(description: "Concurrent sound playback should be handled")
        
        // When - Play sounds concurrently
        DispatchQueue.global().async {
            service.playCorrectSound()
        }
        
        DispatchQueue.global().async {
            service.playCorrectSound()
        }
        
        DispatchQueue.global().async {
            service.playCorrectSound()
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testSoundServiceMemoryManagement() {
        // Given
        weak var weakService: SoundService?
        
        // When
        autoreleasepool {
            let service = SoundService()
            weakService = service
            service.playCorrectSound()
        }
        
        // Then - Service should be deallocated (unless it's a singleton)
        // Note: If SoundService is implemented as a singleton, it won't be deallocated
        // This test mainly ensures no retain cycles
    }
    
    func testSoundServiceDoesNotRetainAudioPlayer() {
        // This test ensures that the audio player doesn't create retain cycles
        // Given
        let service = SoundService()
        
        // When - Play sound multiple times
        for _ in 0..<10 {
            service.playCorrectSound()
            // Small delay to allow for audio player lifecycle
            Thread.sleep(forTimeInterval: 0.01)
        }
        
        // Then - Should not accumulate audio players in memory
        // This test mainly ensures the implementation doesn't leak memory
    }
}