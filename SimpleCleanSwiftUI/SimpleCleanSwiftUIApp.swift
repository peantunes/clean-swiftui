import SwiftUI

@main
struct SimpleCleanSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.serviceProvider, .main)
        }
    }
}
