class Solution {
    func smallestRangeII(_ nums: [Int], _ k: Int) -> Int {
        var sortedNums = Set(nums).sorted()
        guard sortedNums.count > 1 else { return .zero }
        var result = sortedNums.last! - sortedNums.first!
        let lowest = sortedNums.first! + k
        let highest = sortedNums.last! - k
        for i in 1..<sortedNums.count {
            result = min(
                result,
                max(highest, sortedNums[i - 1] + k) - min(lowest, sortedNums[i] - k)
            )
        }
        return result
    }
}
