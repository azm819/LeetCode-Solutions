class Solution {
    private func calcTime(
        _ cur: Int,
        _ time: [Int],
        _ prevs: [[Int]],
        _ endTime: inout [Int?]
    ) -> Int {
        if let result = endTime[cur] {
            return result
        }
        var result = 0
        for i in prevs[cur] {
            result = max(result, calcTime(i, time, prevs, &endTime))
        }
        result += time[cur]
        endTime[cur] = result
        return result
    }

    func minimumTime(_ n: Int, _ relations: [[Int]], _ time: [Int]) -> Int {
        var prevs = Array(repeating: [Int](), count: n)
        var endTime = Array(repeating: Int?.none, count: n)
        for relation in relations {
            prevs[relation[1] - 1].append(relation[0] - 1)
        }
        var result: Int = .zero
        for i in 0 ..< n {
            result = max(result, calcTime(i, time, prevs, &endTime))
        }
        return result
    }
}

