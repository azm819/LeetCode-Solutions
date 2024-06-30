class Solution {
    func arithmeticTriplets(_ nums: [Int], _ diff: Int) -> Int {
        var result = 0
        for i in 0 ..< nums.count - 2 {
            for j in i + 1 ..< nums.count - 1 where nums[j] - nums[i] == diff {
                for k in j + 1 ..< nums.count where nums[k] - nums[j] == diff {
                    result += 1
                    break
                }
                break
            }
        }
        return result
    }
}

