import XCTest
import AVFoundation
@testable import ChineseCharacters

final class UserSettingsTests: XCTestCase {
    
    var userSettings: UserSettings!
    
    override func setUpWithError() throws {
        // Clear UserDefaults before each test
        UserDefaults.standard.removeObject(forKey: "preferredVoiceGender")
        userSettings = UserSettings()
    }
    
    override func tearDownWithError() throws {
        // Clean up UserDefaults after each test
        UserDefaults.standard.removeObject(forKey: "preferredVoiceGender")
        userSettings = nil
    }
    
    func testDefaultVoiceGender() {
        // Given/When - Fresh UserSettings with no saved preferences
        let settings = UserSettings()
        
        // Then
        XCTAssertEqual(settings.preferredVoiceGender, .female, "Default voice gender should be female")
    }
    
    func testVoiceGenderPersistence() {
        // Given
        let settings = UserSettings()
        
        // When - Change voice gender
        settings.preferredVoiceGender = .male
        
        // Then - Setting should be saved to UserDefaults
        let savedValue = UserDefaults.standard.integer(forKey: "preferredVoiceGender")
        XCTAssertEqual(savedValue, AVSpeechSynthesisVoiceGender.male.rawValue)
        
        // When - Create new UserSettings instance
        let newSettings = UserSettings()
        
        // Then - Should load saved preference
        XCTAssertEqual(newSettings.preferredVoiceGender, .male)
    }
    
    func testVoiceGenderChanges() {
        // Given
        let settings = UserSettings()
        XCTAssertEqual(settings.preferredVoiceGender, .female)
        
        // When - Change to male
        settings.preferredVoiceGender = .male
        
        // Then
        XCTAssertEqual(settings.preferredVoiceGender, .male)
        
        // When - Change back to female
        settings.preferredVoiceGender = .female
        
        // Then
        XCTAssertEqual(settings.preferredVoiceGender, .female)
    }
    
    func testUserSettingsIsObservableObject() {
        // Given
        let settings = UserSettings()
        var didChangeNotificationReceived = false
        
        // When - Subscribe to changes
        let cancellable = settings.objectWillChange.sink {
            didChangeNotificationReceived = true
        }
        
        // Then - Changing property should trigger notification
        settings.preferredVoiceGender = .male
        
        XCTAssertTrue(didChangeNotificationReceived, "ObjectWillChange should be triggered")
        
        // Clean up
        cancellable.cancel()
    }
    
    func testInvalidVoiceGenderHandling() {
        // Given - Save an invalid voice gender value to UserDefaults
        UserDefaults.standard.set(999, forKey: "preferredVoiceGender")
        
        // When - Initialize UserSettings
        let settings = UserSettings()
        
        // Then - Should fall back to default
        XCTAssertEqual(settings.preferredVoiceGender, .female, "Should fall back to female for invalid values")
    }
    
    func testMultipleInstancesSyncronization() {
        // Given
        let settings1 = UserSettings()
        let settings2 = UserSettings()
        
        // When - Change setting in first instance
        settings1.preferredVoiceGender = .male
        
        // Then - Second instance should not automatically sync (each maintains its own state)
        // This is expected behavior since @Published doesn't sync across instances
        XCTAssertEqual(settings2.preferredVoiceGender, .female)
        
        // But creating a new instance should load the saved value
        let settings3 = UserSettings()
        XCTAssertEqual(settings3.preferredVoiceGender, .male)
    }
}