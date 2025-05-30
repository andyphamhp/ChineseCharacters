//
//  ChineseCharactersUITests.swift
//  ChineseCharactersUITests
//
//  Created by Andy Pham on 30/3/25.
//

import XCTest

final class ChineseCharactersUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testAppLaunchAndMainTabNavigation() throws {
        // Given
        let app = XCUIApplication()
        app.launch()
        
        // Then - App should launch successfully
        XCTAssertTrue(app.exists, "App should launch successfully")
        
        // Verify main tab view exists with both tabs
        let lessonsTab = app.buttons["Lessons"]
        let conversationsTab = app.buttons["Conversations"]
        
        XCTAssertTrue(lessonsTab.exists, "Lessons tab should exist")
        XCTAssertTrue(conversationsTab.exists, "Conversations tab should exist")
        
        // Test navigation between tabs
        conversationsTab.tap()
        XCTAssertTrue(conversationsTab.isSelected, "Conversations tab should be selected")
        
        lessonsTab.tap()
        XCTAssertTrue(lessonsTab.isSelected, "Lessons tab should be selected")
    }
    
    @MainActor
    func testLessonListDisplaysCorrectly() throws {
        // Given
        let app = XCUIApplication()
        app.launch()
        
        // When - Navigate to lessons tab (should be default)
        let lessonsTab = app.buttons["Lessons"]
        lessonsTab.tap()
        
        // Then - Lesson list should display
        let navigationTitle = app.navigationBars["Học tiếng Trung"]
        XCTAssertTrue(navigationTitle.exists, "Lesson list navigation title should exist")
        
        // Verify at least one lesson exists
        let firstLesson = app.staticTexts["Bài 1"]
        XCTAssertTrue(firstLesson.exists, "First lesson should be visible")
        
        // Verify lesson has title and word count
        let lessonTitle = app.staticTexts["你好 - Xin chào"]
        XCTAssertTrue(lessonTitle.exists, "Lesson title should be visible")
    }
    
    @MainActor
    func testLessonDetailNavigation() throws {
        // Given
        let app = XCUIApplication()
        app.launch()
        
        // When - Tap on first lesson
        let firstLesson = app.staticTexts["Bài 1"]
        XCTAssertTrue(firstLesson.waitForExistence(timeout: 5), "First lesson should appear")
        firstLesson.tap()
        
        // Then - Lesson detail should open
        let lessonDetailTitle = app.navigationBars["你好 - Xin chào"]
        XCTAssertTrue(lessonDetailTitle.waitForExistence(timeout: 5), "Lesson detail should open")
        
        // Verify lesson content exists
        let chineseWord = app.staticTexts["你好"]
        XCTAssertTrue(chineseWord.exists, "Chinese word should be visible")
        
        let pinyin = app.staticTexts["nǐ hǎo"]
        XCTAssertTrue(pinyin.exists, "Pinyin should be visible")
    }
    
    @MainActor
    func testConversationListDisplaysCorrectly() throws {
        // Given
        let app = XCUIApplication()
        app.launch()
        
        // When - Navigate to conversations tab
        let conversationsTab = app.buttons["Conversations"]
        conversationsTab.tap()
        
        // Then - Conversation list should display
        let navigationTitle = app.navigationBars["对话练习"]
        XCTAssertTrue(navigationTitle.waitForExistence(timeout: 5), "Conversation list navigation title should exist")
        
        // Verify at least one conversation exists
        let firstConversation = app.staticTexts["第一次见面"]
        XCTAssertTrue(firstConversation.exists, "First conversation should be visible")
    }
    
    @MainActor
    func testConversationDetailNavigation() throws {
        // Given
        let app = XCUIApplication()
        app.launch()
        
        // When - Navigate to conversations and tap first conversation
        let conversationsTab = app.buttons["Conversations"]
        conversationsTab.tap()
        
        let firstConversation = app.staticTexts["第一次见面"]
        XCTAssertTrue(firstConversation.waitForExistence(timeout: 5), "First conversation should appear")
        firstConversation.tap()
        
        // Then - Conversation detail should open
        let conversationDetailTitle = app.navigationBars["第一次见面"]
        XCTAssertTrue(conversationDetailTitle.waitForExistence(timeout: 5), "Conversation detail should open")
        
        // Verify dialogue content exists
        let dialogueLine = app.staticTexts["你好！"]
        XCTAssertTrue(dialogueLine.exists, "Dialogue line should be visible")
        
        let speaker = app.staticTexts["A"]
        XCTAssertTrue(speaker.exists, "Speaker label should be visible")
    }
    
    @MainActor
    func testPracticeViewNavigation() throws {
        // Given
        let app = XCUIApplication()
        app.launch()
        
        // When - Navigate to lesson and start practice
        let firstLesson = app.staticTexts["Bài 1"]
        firstLesson.tap()
        
        let practiceButton = app.buttons["开始练习"]
        XCTAssertTrue(practiceButton.waitForExistence(timeout: 5), "Practice button should exist")
        practiceButton.tap()
        
        // Then - Practice view should open
        let practiceTitle = app.staticTexts["练习"]
        XCTAssertTrue(practiceTitle.waitForExistence(timeout: 5), "Practice view should open")
        
        // Verify practice elements exist
        let questionText = app.staticTexts.matching(identifier: "questionText").firstMatch
        XCTAssertTrue(questionText.exists, "Question should be displayed")
        
        // Verify answer options exist
        let answerButtons = app.buttons.matching(NSPredicate(format: "identifier BEGINSWITH 'answer'"))
        XCTAssertGreaterThan(answerButtons.count, 0, "Answer options should be available")
    }
    
    @MainActor
    func testSettingsViewNavigation() throws {
        // Given
        let app = XCUIApplication()
        app.launch()
        
        // When - Navigate to settings
        let settingsButton = app.buttons["gear"]
        if settingsButton.exists {
            settingsButton.tap()
            
            // Then - Settings view should open
            let settingsTitle = app.navigationBars["Settings"]
            XCTAssertTrue(settingsTitle.waitForExistence(timeout: 5), "Settings view should open")
            
            // Verify settings content
            let voiceSettings = app.staticTexts["Voice Settings"]
            XCTAssertTrue(voiceSettings.exists, "Voice settings section should exist")
            
            let voiceGenderPicker = app.buttons["Female"] // or Male
            XCTAssertTrue(voiceGenderPicker.exists, "Voice gender picker should exist")
        }
    }
    
    @MainActor
    func testAudioButtonsExist() throws {
        // Given
        let app = XCUIApplication()
        app.launch()
        
        // When - Navigate to lesson detail
        let firstLesson = app.staticTexts["Bài 1"]
        firstLesson.tap()
        
        // Then - Audio buttons should exist
        let audioButtons = app.buttons.matching(NSPredicate(format: "identifier CONTAINS 'speaker'"))
        XCTAssertGreaterThan(audioButtons.count, 0, "Audio buttons should be present")
        
        // Test tapping an audio button (should not crash)
        if audioButtons.count > 0 {
            audioButtons.firstMatch.tap()
        }
    }
    
    @MainActor
    func testNavigationBackButton() throws {
        // Given
        let app = XCUIApplication()
        app.launch()
        
        // When - Navigate to lesson detail
        let firstLesson = app.staticTexts["Bài 1"]
        firstLesson.tap()
        
        // Then - Back button should work
        let backButton = app.navigationBars.buttons.firstMatch
        if backButton.exists {
            backButton.tap()
            
            // Verify we're back at lesson list
            let lessonListTitle = app.navigationBars["Học tiếng Trung"]
            XCTAssertTrue(lessonListTitle.waitForExistence(timeout: 5), "Should return to lesson list")
        }
    }
    
    @MainActor
    func testScrollingInLessonList() throws {
        // Given
        let app = XCUIApplication()
        app.launch()
        
        // When - Scroll in lesson list
        let lessonList = app.scrollViews.firstMatch
        if lessonList.exists {
            lessonList.swipeUp()
            lessonList.swipeDown()
        }
        
        // Then - App should handle scrolling without crashes
        XCTAssertTrue(app.exists, "App should remain responsive after scrolling")
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
