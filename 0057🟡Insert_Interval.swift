class Solution {
    func intersects(_ f: [Int], _ s: [Int]) -> Bool {
        return s[0] <= f[0] && f[0] <= s[1] || s[0] <= f[1] && f[1] <= s[1] || f[0] <= s[0] && s[0] <= f[1] || f[0] <= s[1] && s[1] <= f[1]
    }

    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard !intervals.isEmpty else { return [newInterval] }
        var result = [[Int]]()
        var minI = newInterval[0]
        var maxI = newInterval[1]
        var old = false
        var wasIn = false
        for int in intervals {
            let isIn = intersects(int, newInterval)
            if isIn {
                wasIn = true
                minI = min(minI, int[0])
                maxI = max(maxI, int[1])
            } else {
                if isIn != old {
                    result.append([minI, maxI])
                }
                result.append(int)
            }
            old = isIn
        }
        if old {
            result.append([minI, maxI])
        } else if !wasIn {
            var i = 0
            while i < intervals.count && intervals[i][0] < newInterval[0] {
                i += 1
            }
            result.insert(newInterval, at: i)
        }
        return result
    }
}
