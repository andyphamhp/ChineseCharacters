import Foundation
import AVFoundation

class SoundService: ObservableObject {
    private var audioPlayer: AVAudioPlayer?
    
    func playCorrectSound() {
        guard let soundURL = Bundle.main.url(forResource: "correct", withExtension: "mp3") else {
            print("Sound file not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error)")
        }
    }
} 