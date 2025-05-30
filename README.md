# Chinese Characters Learning App

An iOS SwiftUI application designed to help Vietnamese speakers learn Chinese characters through interactive lessons and practice exercises.

## Features

### 📚 Comprehensive Lessons
- **10 Complete Lessons** with ~260 Chinese words
- Each word includes: Chinese characters, pinyin, Vietnamese translation, English translation
- Example sentences for practical context
- Topics cover: greetings, polite expressions, countries, food, shopping, office/home vocabulary

### 🎯 Interactive Practice Modes
- **Mixed Practice**: All question types combined
- **Pinyin Recognition**: Focus on pronunciation
- **Vietnamese Translation**: Meaning comprehension
- **Chinese Characters**: Character recognition

### 🔊 Audio Features
- **Text-to-Speech**: Native Chinese pronunciation for all content
- **Voice Options**: Configurable male/female voices
- **Audio Feedback**: Sound effects for correct answers
- **Instant Pronunciation**: Hear words immediately after practice

### 💬 Conversation Practice
- **Dialogue Format**: Real conversation scenarios
- **Interactive Audio**: Tap to hear each line
- **Cultural Context**: Practical everyday situations

## Screenshots

*Screenshots coming soon*

## Requirements

- **iOS 18.0+**
- **Xcode 15+**
- **Devices**: iPhone, iPad, Apple TV
- **Language Support**: Chinese (Simplified) for text-to-speech

## Installation

### Development Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/andyphamhp/ChineseCharacters.git
   cd ChineseCharacters
   ```

2. **Open in Xcode**
   ```bash
   open ChineseCharacters.xcodeproj
   ```

3. **Build and Run**
   - Select your target device/simulator
   - Press `Cmd + R` to build and run

### Build Commands

```bash
# Build for iOS Simulator
xcodebuild -scheme ChineseCharacters -destination 'platform=iOS Simulator,name=iPhone 15' build

# Run tests
xcodebuild test -scheme ChineseCharacters -destination 'platform=iOS Simulator,name=iPhone 15'

# Clean build
xcodebuild -scheme ChineseCharacters clean
```

## Usage

### Getting Started
1. Launch the app
2. Browse available lessons in the **Lessons** tab
3. Tap any lesson to view vocabulary with audio
4. Start practice mode to test your knowledge
5. Explore conversations in the **Conversations** tab

### Practice Flow
1. **Select Lesson** → Choose from 10 available lessons
2. **Review Words** → See characters, pinyin, meanings, and examples
3. **Start Practice** → Choose practice mode and difficulty
4. **Get Feedback** → Immediate visual and audio responses
5. **Track Progress** → See your accuracy and improvement

## Architecture

### Technology Stack
- **Language**: Swift 5.9+
- **UI Framework**: SwiftUI
- **Audio**: AVFoundation (Text-to-Speech, Audio Playback)
- **Architecture**: MVVM Pattern
- **Persistence**: UserDefaults (settings)

### Project Structure
```
ChineseCharacters/
├── Models/
│   ├── ChineseWord.swift       # Core vocabulary model
│   ├── Lesson.swift           # Lesson organization
│   ├── Conversation.swift     # Dialogue content
│   └── UserSettings.swift     # User preferences
├── Views/
│   ├── LessonListView.swift   # Main lesson browser
│   ├── LessonDetailView.swift # Word display and practice
│   ├── PracticeView.swift     # Interactive quiz
│   ├── ConversationListView.swift # Dialogue browser
│   ├── ConversationDetailView.swift # Dialogue player
│   ├── MainTabView.swift      # Tab navigation
│   └── SettingsView.swift     # User preferences
└── Services/
    ├── SpeechService.swift    # Text-to-speech management
    └── SoundService.swift     # Audio feedback
```

## Contributing

### Development Guidelines
- Follow SwiftUI best practices
- Maintain MVVM architecture
- Include audio for all Chinese content
- Test on multiple device sizes
- Update documentation for new features

### Adding New Lessons
1. Add vocabulary to `Lesson.swift`
2. Follow existing data structure
3. Include pinyin, Vietnamese, English, and examples
4. Test audio pronunciation

## Roadmap

### Upcoming Features
- [ ] **Data Persistence**: Save progress and practice history
- [ ] **Spaced Repetition**: Intelligent review scheduling
- [ ] **Progress Tracking**: Visual learning analytics
- [ ] **Search Functionality**: Find words across lessons
- [ ] **Favorites System**: Bookmark difficult words
- [ ] **Achievement System**: Gamification elements

### Technical Improvements
- [ ] **Unit Tests**: Comprehensive test coverage
- [ ] **Accessibility**: VoiceOver and dynamic type support
- [ ] **Localization**: Multiple interface languages
- [ ] **Performance**: Optimize for older devices

## License

This project is available under the MIT License. See LICENSE file for details.

## Acknowledgments

- Chinese language content sourced from educational materials
- Vietnamese translations tailored for Vietnamese speakers
- Audio powered by iOS Text-to-Speech engine

## Support

For issues, feature requests, or contributions, please visit the [GitHub repository](https://github.com/andyphamhp/ChineseCharacters/issues).

---

**Learning Chinese, one character at a time** 🇨🇳 ➡️ 🇻🇳