import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()

    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in }
    }

    func scheduleCompletionNotification(for session: FocusSession) {
        let content = UNMutableNotificationContent()
        content.title = "Session Complete"
        content.body = "\(session.title) has finished."

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: session.duration, repeats: false)
        let request = UNNotificationRequest(identifier: session.title, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
