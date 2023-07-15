class Solution {
    private func binSearch(_ day: Int, _ days: [Int]) -> Int? {
        guard day <= days.last! else { return nil }
        var l = 0
        var r = days.count - 1
        while l < r {
            let c = (l + r) / 2
            if days[c] < day {
                l = c + 1
            } else {
                r = c
            }
        }
        return r
    }

    private func dp(
        _ curDay: Int,
        _ days: [Int],
        _ eventsCount: Int,
        _ calendar: [Int: [(Int, Int)]],
        _ memo: inout [[Int: Int]]
    ) -> Int {
        guard eventsCount > .zero, let dayInd = binSearch(curDay, days) else {
            return .zero
        }
        if let mem = memo[dayInd][eventsCount] {
            return mem
        }
        let nextDay = days[dayInd]
        var result = dp(nextDay + 1, days, eventsCount, calendar, &memo)
        for event in calendar[nextDay]! {
            result = max(result, dp(event.0 + 1, days, eventsCount - 1, calendar, &memo) + event.1)
        }
        memo[dayInd][eventsCount] = result
        return result
    }

    func maxValue(_ events: [[Int]], _ k: Int) -> Int {
        var calendar = [Int: [(Int, Int)]]()
        var days = Set<Int>()
        for event in events {
            calendar[event[0], default: []].append((event[1], event[2]))
            days.insert(event[0])
        }
        var memo = Array(repeating: [Int: Int](), count: days.count)
        return dp(1, days.sorted(), k, calendar, &memo)
    }
}
