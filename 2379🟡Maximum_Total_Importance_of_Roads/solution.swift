class Solution {
    func maximumImportance(_ n: Int, _ roads: [[Int]]) -> Int {
        var counts = Array(repeating: 0, count: n)
        for road in roads {
            counts[road[0]] += 1
            counts[road[1]] += 1
        }
        counts.sort()

        var result = 0
        for i in 0 ..< counts.count {
            result += (i + 1) * counts[i]
        }
        return result
    }
}

