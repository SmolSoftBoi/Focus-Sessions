import SwiftUI

struct SessionView: View {
    @Bindable var session: FocusSession
    @State private var timeRemaining: TimeInterval
    @State private var timer: Timer?

    init(session: FocusSession) {
        self.session = session
        _timeRemaining = State(initialValue: session.duration)
    }

    var body: some View {
        VStack(spacing: 20) {
            Text(session.title)
                .font(.largeTitle)

            Text(timeString)
                .font(.system(size: 48))
                .monospacedDigit()

            if timer == nil {
                Button("Start Session") {
                    startTimer()
                }
                .font(.title2)
            } else {
                Button("Pause Session") {
                    pauseTimer()
                }
                .font(.title2)
            }
        }
        .padding()
        .onDisappear {
            timer?.invalidate()
        }
    }

    private var timeString: String {
        let minutes = Int(timeRemaining) / 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                session.isCompleted = true
                timer?.invalidate()
                // Trigger notification if needed
            }
        }
    }

    private func pauseTimer() {
        timer?.invalidate()
        timer = nil
    }
}
