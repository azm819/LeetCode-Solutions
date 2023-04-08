class Solution {
    func smallestRangeI(_ nums: [Int], _ k: Int) -> Int {
        var sortedNums = nums.sorted()
        let diff = sortedNums.last! - sortedNums.first!
        return diff - min(diff, 2 * k)
    }
}
