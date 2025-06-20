import SwiftUI
import AVFoundation

struct SettingsView: View {
    @StateObject private var settings = UserSettings()
    @StateObject private var speechService = SpeechService()
    
    var body: some View {
        Form {
            Section(header: Text("Voice Settings")) {
                Picker("Voice Gender", selection: $settings.preferredVoiceGender) {
                    Text("Female").tag(AVSpeechSynthesisVoiceGender.female)
                    Text("Male").tag(AVSpeechSynthesisVoiceGender.male)
                }
                
                // Preview button
                Button(action: {
                    speechService.speak(text: "你好", gender: settings.preferredVoiceGender)
                }) {
                    HStack {
                        Text("Preview Voice")
                        Spacer()
                        Image(systemName: "speaker.wave.2")
                    }
                }
            }
            
            Section(header: Text("About")) {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("1.0.0")
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
} 