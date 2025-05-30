import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                LessonListView()
            }
            .tabItem {
                Label("课程", systemImage: "book.fill")
            }
            
            NavigationStack {
                ConversationListView()
            }
            .tabItem {
                Label("对话", systemImage: "bubble.left.and.bubble.right.fill")
            }
            
            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label("设置", systemImage: "gear")
            }
        }
    }
}