# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an iOS/macOS SwiftUI application for learning Chinese characters. The app is designed for Vietnamese speakers learning Chinese, providing character recognition practice with pinyin, Vietnamese, and English translations.

## Architecture

### Key Components

1. **Models** (ChineseCharacters/Models/)
   - `ChineseWord`: Core data structure containing character, pinyin, meanings, and examples
   - `Lesson`: Groups words into themed lessons with sample data
   - `UserSettings`: Manages user preferences for practice modes and display options

2. **Views** (ChineseCharacters/Views/)
   - `LessonListView`: Main navigation showing all available lessons
   - `LessonDetailView`: Displays lesson content and allows starting practice
   - `PracticeView`: Interactive quiz interface with multiple practice modes
   - `PracticeSummaryView`: Shows results after completing practice
   - `SettingsView`: User preferences management

3. **Services** (ChineseCharacters/Services/)
   - `SpeechService`: Text-to-speech for Chinese pronunciation
   - `SoundService`: Audio feedback for correct/incorrect answers

### Practice Modes
The app supports multiple practice types:
- Meaning recognition (Vietnamese translation)
- Pinyin recognition
- English translation
- Character writing practice

## Development Commands

### Building
```bash
# Build for iOS Simulator
xcodebuild -scheme ChineseCharacters -destination 'platform=iOS Simulator,name=iPhone 15' build

# Build for macOS
xcodebuild -scheme ChineseCharacters -destination 'platform=macOS' build

# Clean build
xcodebuild -scheme ChineseCharacters clean
```

### Testing
```bash
# Run unit tests
xcodebuild test -scheme ChineseCharacters -destination 'platform=iOS Simulator,name=iPhone 15'

# Run UI tests
xcodebuild test -scheme ChineseCharactersUITests -destination 'platform=iOS Simulator,name=iPhone 15'
```

### Running
```bash
# Open in Xcode
open ChineseCharacters.xcodeproj

# Run on iOS Simulator
xcodebuild -scheme ChineseCharacters -destination 'platform=iOS Simulator,name=iPhone 15' run
```

## Key Implementation Details

1. **Lesson Data**: All lesson content is currently hardcoded in `Lesson.swift` as static sample data. When adding new lessons, follow the existing pattern with complete word definitions including examples.

2. **Sound Assets**: The app uses MP3 files for audio feedback stored in `ChineseCharacters/Sound/`. Currently only `correct.mp3` exists.

3. **Speech Synthesis**: Uses `AVSpeechSynthesizer` with Chinese locale (`zh-CN`) for pronunciation. The service is configured with slower speech rate for learning purposes.

4. **Practice Flow**: 
   - User selects lesson → chooses practice settings → practices with randomized words → receives feedback → views summary
   - Practice sessions track correct/incorrect answers and calculate accuracy percentages

5. **User Settings**: Persisted using `@AppStorage` for practice preferences including display modes and practice types.

## Important Notes

- The app is built with SwiftUI and requires iOS 17.0+ / macOS 14.0+
- Text-to-speech requires device language support for Chinese
- No external dependencies - uses only Apple frameworks
- Build artifacts are stored in Xcode's DerivedData directory (see buildServer.json)

## MANDATORY Development Rules

### **Test-Driven Development Protocol**
**CRITICAL**: After ANY code changes (new features, bug fixes, refactoring), you MUST:

1. **Compile and Build** - Ensure code compiles successfully:
   ```bash
   xcodebuild -scheme ChineseCharacters -destination 'platform=iOS Simulator,name=iPhone 16' build
   ```

2. **Run All Tests** - Verify all tests pass before proceeding:
   ```bash
   # Run unit tests
   xcodebuild test -scheme ChineseCharacters -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing:ChineseCharactersTests
   
   # Run UI tests (if changes affect UI)
   xcodebuild test -scheme ChineseCharacters -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing:ChineseCharactersUITests
   ```

3. **Fix All Failures** - Address any compilation errors or test failures immediately

### **Quality Gates**
- **No broken builds**: Code must compile without errors
- **No failing tests**: All existing tests must continue to pass
- **Test coverage**: New features MUST include corresponding tests
- **Documentation**: Update tests when changing existing functionality

### **Enforcement**
- **STOP immediately** if builds fail or tests don't pass
- **Do NOT proceed** to next development steps until all tests are green
- **Add new tests** for any new functionality before considering the work complete
- **Update existing tests** if behavior changes are intentional

### **Exception Handling**
- If tests fail due to intentional breaking changes, update tests first
- If build fails, fix compilation errors before any other work
- Document any test changes in commit messages

This protocol ensures code quality, prevents regressions, and maintains a stable codebase.

## Memory bank
@memory-bank.md

## Task Master AI
@taskmaster-ai.md

## Sequential Thinking Tool

When working on complex features or architectural decisions in this project, use the Sequential Thinking MCP server for structured problem-solving. This tool is particularly valuable for:

- Planning data persistence implementation (SwiftData vs Core Data)
- Designing the practice summary integration
- Implementing spaced repetition algorithms
- Resolving complex UI/UX challenges
- Breaking down multi-step feature implementations

To enable Sequential Thinking, follow the setup instructions in `docs/sequential-thinking-setup.md`.
