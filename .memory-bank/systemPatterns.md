# System Patterns: Chinese Characters Learning App

## Architecture Overview

### Design Pattern: MVVM with SwiftUI
```
Views (SwiftUI) ←→ ViewModels (@StateObject) ←→ Models (Data Structures)
                                   ↓
                              Services (Audio, Speech)
```

## Core Components

### Models Layer
1. **ChineseWord**
   - Properties: character, pinyin, vietnameseMeaning, englishMeaning, examples
   - Immutable value type (struct)
   - Serves as basic vocabulary unit

2. **Lesson**
   - Contains array of ChineseWord instances
   - Static data definition in extension
   - Identifiable for SwiftUI lists

3. **UserSettings**
   - ObservableObject for reactive UI updates
   - Persists to UserDefaults
   - Currently only tracks voice preference

### Views Layer
1. **Navigation Hierarchy**
   ```
   ChineseCharactersApp
   └── NavigationStack
       └── LessonListView
           └── LessonDetailView
               └── PracticeView
                   └── (PracticeSummaryView - not connected)
   ```

2. **View Responsibilities**
   - LessonListView: Display all lessons, navigation entry point
   - LessonDetailView: Show words in lesson, play audio, launch practice
   - PracticeView: Interactive quiz with multiple modes
   - SettingsView: Voice preference configuration

### Services Layer
1. **SpeechService**
   - Singleton pattern for TTS management
   - Configurable voice (male/female)
   - Handles Chinese pronunciation

2. **SoundService**
   - Plays audio feedback (correct.mp3)
   - Simple AVAudioPlayer wrapper

## Key Design Decisions

### State Management
- **@StateObject**: Used for view-owned observable objects
- **@ObservedObject**: For injected observable objects
- **@State**: Local view state (selected options, counters)
- **@FocusState**: Keyboard focus management

### Data Flow
1. Static lesson data loaded at compile time
2. Views observe UserSettings for voice changes
3. Practice generates questions dynamically from lesson words
4. No data persistence beyond voice preference

### Practice System Architecture
```
PracticeView State:
- currentQuestionIndex
- selectedAnswer
- showResult
- correctAnswers
- questions (randomized)

Question Generation:
1. Shuffle lesson words
2. For each word, randomly select practice type
3. Generate 4 answer options (1 correct, 3 random)
4. Present with immediate feedback
```

## Architectural Patterns

### Singleton Services
```swift
class SpeechService {
    static let shared = SpeechService()
    private init() {}
}
```

### Observable Pattern
```swift
class UserSettings: ObservableObject {
    @Published var selectedVoice: String
}
```

### View Composition
- Small, focused view components
- Extracted subviews for reusability
- Clear separation of concerns

## Extension Points

### Adding New Features
1. **New Practice Modes**: Add case to practiceType enum
2. **Additional Languages**: Extend ChineseWord model
3. **Progress Tracking**: Create new ObservableObject service
4. **More Audio**: Extend SoundService with more effects

### Data Persistence Options
1. **SwiftData**: Already imported, natural fit for iOS 17+
2. **Core Data**: More complex but battle-tested
3. **JSON Files**: Simple offline storage
4. **UserDefaults**: For simple preferences (current approach)

## Technical Constraints
- iOS 18.0+ requirement enables latest SwiftUI features
- Offline-first design (no network dependencies)
- Memory-based data (no disk I/O for lessons)
- System TTS limits voice customization