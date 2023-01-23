class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for i in 0..<nums.count {
            if let val = map[target - nums[i]] {
                return [val, i]
            }
            map[nums[i]] = i
        }
        return []
    }
}
