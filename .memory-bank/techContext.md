# Technical Context: Chinese Characters Learning App

## Technology Stack

### Core Technologies
- **Language**: Swift 5.9+
- **UI Framework**: SwiftUI
- **Platform**: iOS 18.0+
- **IDE**: Xcode 15+
- **Audio**: AVFoundation (AVSpeechSynthesizer, AVAudioPlayer)
- **Persistence**: UserDefaults
- **Architecture**: MVVM

### Project Configuration
- **Bundle ID**: com.andypham.ChineseCharacters
- **Deployment Target**: iOS 18.0
- **Supported Devices**: iPhone, iPad, Apple TV
- **Orientation**: Portrait and Landscape
- **Build System**: Xcode Build System

## Development Setup

### Prerequisites
1. macOS with Xcode 15 or later
2. iOS Simulator or physical device running iOS 18.0+
3. Git for version control

### Build Commands
```bash
# Build for debug
xcodebuild -scheme ChineseCharacters -configuration Debug build

# Build for release
xcodebuild -scheme ChineseCharacters -configuration Release build

# Run tests
xcodebuild -scheme ChineseCharacters test

# Clean build folder
xcodebuild -scheme ChineseCharacters clean
```

### Project Structure
```
ChineseCharacters/
├── ChineseCharactersApp.swift    # App entry point
├── Models/                        # Data models
│   ├── ChineseWord.swift
│   ├── Lesson.swift
│   └── UserSettings.swift
├── Views/                         # SwiftUI views
│   ├── LessonListView.swift
│   ├── LessonDetailView.swift
│   ├── PracticeView.swift
│   ├── PracticeSummaryView.swift
│   └── SettingsView.swift
├── Services/                      # Business logic
│   ├── SpeechService.swift
│   └── SoundService.swift
├── Sound/                         # Audio assets
│   └── correct.mp3
└── Assets.xcassets/              # Images and colors
```

## Dependencies

### System Frameworks
- **SwiftUI**: Modern declarative UI framework
- **AVFoundation**: Audio playback and text-to-speech
- **SwiftData**: Imported but not currently used
- **Foundation**: Core Swift functionality

### Third-Party Dependencies
None - the app is built entirely with Apple's frameworks

## Technical Constraints

### Platform Limitations
1. **iOS 18.0+ Requirement**
   - Enables latest SwiftUI features
   - Limits user base to newest devices
   - Allows use of newest Swift concurrency features

2. **Text-to-Speech**
   - Limited to system voices
   - Chinese pronunciation quality depends on iOS version
   - No custom voice training possible

3. **Offline-First Design**
   - All data bundled with app
   - No server requirements
   - Increases app size with embedded content

### Performance Considerations
- Lesson data loaded in memory (no lazy loading)
- Audio files cached by system
- TTS may have slight delay on first use
- Practice questions generated on-demand

## Development Workflow

### Code Style
- SwiftUI declarative syntax
- Swift naming conventions
- Minimal comments (self-documenting code)
- View extraction for reusability

### Version Control
- Git repository initialized
- .gitignore configured for Xcode
- Uncommitted changes in Lesson.swift

### Testing Strategy
- UI test targets created but not implemented
- No unit tests currently
- Manual testing on simulator/device

## Security Considerations
- No network connections
- No user data collection
- Voice preference stored locally
- No authentication required
- No sensitive data handling

## Deployment Configuration
- Code signing required for device testing
- App Store Connect setup needed for distribution
- No special entitlements required
- Standard iOS app sandbox

## Known Technical Debt
1. Unused template files (ContentView, Item)
2. SwiftData imported but not utilized
3. No error handling for audio failures
4. No analytics or crash reporting
5. No accessibility features implemented
6. No localization beyond Vietnamese/English content