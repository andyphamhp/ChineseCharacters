# Active Context: Chinese Characters Learning App

## Current Work Focus
As of latest update, the app has recently expanded from 4 to 10 complete lessons, significantly increasing the vocabulary coverage from ~20 words to ~260 words.

## Recent Changes
1. **Lesson Expansion** (Most Recent)
   - Added Lessons 5-10 with comprehensive vocabulary
   - Each new lesson includes 20-30 words with examples
   - Covered topics: polite expressions, countries/nationalities, food, shopping, money, office/home

2. **Content Enhancement**
   - Added more complex vocabulary beyond basic greetings
   - Included practical scenarios (dining, shopping, currency exchange)
   - Maintained consistent structure: character, pinyin, Vietnamese, English, examples

## Active Decisions
1. **Data Storage**: Currently using hardcoded lesson data in `Lesson.swift`
   - Decision: Keep static for now, consider database migration later
   - Rationale: Simplicity and offline functionality

2. **Practice Flow**: Practice summary view exists but not integrated
   - Decision: Defer integration until user persistence is implemented
   - Rationale: Summary is less useful without historical data

3. **Voice Options**: Using system TTS with male/female options
   - Decision: Sufficient for current needs
   - Rationale: Native iOS TTS provides good Chinese pronunciation

## Next Steps Priority
1. **Data Persistence**
   - Implement practice history tracking
   - Save user progress per lesson
   - Track difficult words for targeted practice

2. **Practice Enhancement**
   - Integrate PracticeSummaryView into practice flow
   - Add spaced repetition algorithm
   - Implement lesson completion tracking

3. **Code Cleanup**
   - Remove unused template files (ContentView, Item)
   - Optimize practice question generation
   - Add proper error handling for audio playback

## Known Issues
- No data persistence between app launches
- PracticeSummaryView created but not connected
- Template files from project creation still present
- No unit or integration tests

## Development Notes
- Git status shows uncommitted changes to Lesson.swift
- Project uses Xcode with SwiftUI
- Targets iOS 18.0+ for latest SwiftUI features
- Audio feedback working well with correct.mp3