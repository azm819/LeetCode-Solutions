class MyCalendarTwo {
    private typealias Event = Range<Int>
    private var events = [Event]()

    func book(_ start: Int, _ end: Int) -> Bool {
        var newEvent = start ..< end
        for event in events where event.overlaps(newEvent) {
            var intersection = max(event.lowerBound, newEvent.lowerBound) ..< min(event.upperBound, newEvent.upperBound)
            var count = 0
            for event in events where event.overlaps(intersection) {
                count += 1
                if count > 1 {
                    return false
                }
            }
        }
        events.append(newEvent)
        return true
    }
}

/**
 * Your MyCalendarTwo object will be instantiated and called as such:
 * let obj = MyCalendarTwo()
 * let ret_1: Bool = obj.book(start, end)
 */
