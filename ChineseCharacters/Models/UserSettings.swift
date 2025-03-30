import Foundation
import AVFoundation

class UserSettings: ObservableObject {
    @Published var preferredVoiceGender: AVSpeechSynthesisVoiceGender {
        didSet {
            UserDefaults.standard.set(preferredVoiceGender.rawValue, forKey: "preferredVoiceGender")
        }
    }
    
    init() {
        // Load saved preferences or use defaults
        let savedGender = UserDefaults.standard.integer(forKey: "preferredVoiceGender")
        self.preferredVoiceGender = AVSpeechSynthesisVoiceGender(rawValue: savedGender) ?? .female
    }
} 