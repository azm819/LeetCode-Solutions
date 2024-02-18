class Solution {
    func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
        var ends = Array(repeating: 0, count: n)
        var counts = Array(repeating: 0, count: n)
        let meetings = meetings
            .map { (start: $0[0], end: $0[1]) }
            .sorted { $0.start < $1.start }
        for meeting in meetings {
            var ind = -1
            var minEnd: Int = .max
            for i in 0 ..< n {
                if ends[i] <= meeting.start {
                    ind = i
                    break
                } else if ends[i] < minEnd {
                    minEnd = ends[i]
                    ind = i
                }
            }
            counts[ind] += 1
            ends[ind] = max(ends[ind], meeting.start) + (meeting.end - meeting.start)
        }
        var result = -1
        var maxCount: Int = .min
        for i in 0 ..< n where counts[i] > maxCount {
            maxCount = counts[i]
            result = i
        }
        return result
    }
}

