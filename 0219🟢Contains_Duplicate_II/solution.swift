class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        let k = min(k + 1, nums.count)
        var counts = Set<Int>()
        for i in 0 ..< k {
            if !counts.insert(nums[i]).inserted {
                return true
            }
        }
        guard k < nums.count else { return false }
        for i in k ..< nums.count {
            counts.remove(nums[i - k])
            if !counts.insert(nums[i]).inserted {
                return true
            }
        }
        return false
    }
}
