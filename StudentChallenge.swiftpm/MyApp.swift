import SwiftUI

@main
struct MyApp: App {
    // create an instance of UserSettings
    let settings = UserSettings()

    var body: some Scene {
        WindowGroup {
            WorkThroughFirst(settings: settings)
//            EmotionEvaluation()
                .environmentObject(UserSettings())
        }
    }
}
