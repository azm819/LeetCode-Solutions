class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        var currW = [Int]()
        let sortedIntervals = intervals.sorted {
            return $0[0] < $1[0] || $0[0] == $1[0] && $0[1] < $1[1]
        }
        sortedIntervals.forEach {
            if currW.isEmpty {
                currW = $0
            } else {
                if currW[1] >= $0[0] {
                    currW[1] = max($0[1], currW[1])
                } else {
                    result.append(currW)
                    currW = $0
                }
            }
        }
        if !currW.isEmpty {
            result.append(currW)
        }
        return result
    }
}
