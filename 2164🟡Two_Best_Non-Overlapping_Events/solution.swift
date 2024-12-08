class Solution {
    private func dp(
        _ ind: Int,
        _ prevEndTime: Int,
        _ eventsLeft: Int,
        _ events: [(start: Int, end: Int, value: Int)],
        _ memo: inout [[Int?]]
    ) -> Int {
        guard eventsLeft > .zero && ind < events.count else {
            return .zero
        }

        guard prevEndTime < events[ind].start else {
            return dp(ind + 1, prevEndTime, eventsLeft, events, &memo)
        }

        if let mem = memo[ind][eventsLeft - 1] {
            return mem
        }

        let result = max(
            dp(ind + 1, prevEndTime, eventsLeft, events, &memo),
            events[ind].value + dp(ind + 1, events[ind].end, eventsLeft - 1, events, &memo)
        )

        memo[ind][eventsLeft - 1] = result

        return result
    }

    func maxTwoEvents(_ events: [[Int]]) -> Int {
        let sortedEvents: [(start: Int, end: Int, value: Int)] = events
            .map { ($0[0], $0[1], $0[2]) }
            .sorted { $0.start < $1.start }

        var memo = Array(repeating: Array(repeating: Int?.none, count: 2), count: sortedEvents.count)
        return dp(.zero, .zero, 2, sortedEvents, &memo)
    }
}
