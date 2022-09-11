class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        return intervals.sorted {
            return $0[0] < $1[0]
        }.reduce(into: [[Int]]()) { (result, element) in
            if result.isEmpty {
                result.append(element)
            } else {
                let n = result.count - 1
                if result[n][1] >= element[0] {
                    result[n][1] = max(element[1], result[n][1])
                } else {
                    result.append(element)
                }
            }
        }
    }
}
