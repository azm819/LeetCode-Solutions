class Solution {
    private func intersects(_ f: [Int], _ s: [Int]) -> Bool {
        return s[0] <= f[0] && f[0] <= s[1] || s[0] <= f[1] && f[1] <= s[1] ||
            f[0] <= s[0] && s[0] <= f[1] || f[0] <= s[1] && s[1] <= f[1]
    }

    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var result = [newInterval]
        for interval in intervals {
            if let lastInterval = result.popLast() {
                if intersects(lastInterval, interval) {
                    result.append([min(lastInterval[0], interval[0]), max(lastInterval[1], interval[1])])
                } else {
                    if lastInterval[0] < interval[0] {
                        result.append(lastInterval)
                        result.append(interval)
                    } else {
                        result.append(interval)
                        result.append(lastInterval)
                    }
                }
            } else {
                result.append(interval)
            }
        }
        return result
    }
}

