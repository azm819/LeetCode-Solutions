class MyCalendar {
    private struct Period {
        let from: Int
        let to: Int

        func notIntersects(with other: Period) -> Bool {
            other.from >= to || from >= other.to
        }
    }

    private var events = [Period]()

    func book(_ start: Int, _ end: Int) -> Bool {
        let newEvent = Period(from: start, to: end)
        guard events.allSatisfy({ $0.notIntersects(with: newEvent) }) else {
            return false
        }
        events.append(newEvent)
        return true
    }
}

/**
 * Your MyCalendar object will be instantiated and called as such:
 * let obj = MyCalendar()
 * let ret_1: Bool = obj.book(start, end)
 */
