import Foundation
import AVFoundation

class SpeechService: ObservableObject {
    private let synthesizer = AVSpeechSynthesizer()
    
    // Available voices for Chinese
    private var chineseVoices: [AVSpeechSynthesisVoice] {
        AVSpeechSynthesisVoice.speechVoices().filter { $0.language.starts(with: "zh") }
    }
    
    // Get available voices by gender
    func getVoicesByGender(_ gender: AVSpeechSynthesisVoiceGender) -> [AVSpeechSynthesisVoice] {
        chineseVoices.filter { $0.gender == gender }
    }
    
    // Get default voice for gender
    func getDefaultVoice(for gender: AVSpeechSynthesisVoiceGender) -> AVSpeechSynthesisVoice? {
        getVoicesByGender(gender).first
    }
    
    func speak(text: String, language: String = "zh-CN", gender: AVSpeechSynthesisVoiceGender? = nil) {
        let utterance = AVSpeechUtterance(string: text)
        
        // Use provided gender or get from UserDefaults
        let preferredGender = gender ?? {
            let savedGender = UserDefaults.standard.integer(forKey: "preferredVoiceGender")
            return AVSpeechSynthesisVoiceGender(rawValue: savedGender) ?? .female
        }()
        
        // Set voice based on gender preference
        if let voice = getDefaultVoice(for: preferredGender) {
            utterance.voice = voice
        } else {
            // Fallback to default Chinese voice if preferred gender not available
            utterance.voice = AVSpeechSynthesisVoice(language: language)
        }
        
        utterance.rate = 0.3  // Slower speed for learning
        utterance.pitchMultiplier = 1.0
        utterance.volume = 1.0
        
        synthesizer.speak(utterance)
    }
    
    func stopSpeaking() {
        synthesizer.stopSpeaking(at: .immediate)
    }
} 
