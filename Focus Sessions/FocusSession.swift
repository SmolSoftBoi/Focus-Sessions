import Foundation
import SwiftData

@Model
final class FocusSession {
    var title: String
    var duration: TimeInterval
    var isCompleted: Bool = false

    init(title: String, duration: TimeInterval) {
        self.title = title
        self.duration = duration
    }
}
