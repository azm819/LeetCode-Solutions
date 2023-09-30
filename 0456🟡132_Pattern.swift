class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        var intervals = [(Int, Int)]()
        var minInd = 0
        for i in 0 ..< nums.count {
            if intervals.contains(where: { nums[i] > $0.0 && nums[i] < $0.1 }) {
                return true
            }
            if nums[i] - nums[minInd] > 1 {
                intervals.append((nums[minInd], nums[i]))
            }
            if nums[i] < nums[minInd] {
                minInd = i
            }
        }
        return false
    }
}
