class Solution {
    func resultsArray(_ nums: [Int], _ k: Int) -> [Int] {
        var lastNum: Int = .min
        var curCount: Int = .zero
        var result = [Int]()
        for i in 0 ..< nums.count {
            if nums[i] == lastNum + 1 {
                curCount += 1
            } else {
                curCount = 1
            }

            lastNum = nums[i]

            if i >= k - 1 {
                result.append(curCount >= k ? nums[i] : -1)
            }
        }

        return result
    }
}

