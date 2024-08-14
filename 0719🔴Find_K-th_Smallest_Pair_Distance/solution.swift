class Solution {
    private func calcPairs(_ nums: [Int], _ distance: Int) -> Int {
        var result = 0
        var l = 0
        var r = 0
        while r < nums.count - 1 {
            r += 1

            while nums[r] - nums[l] > distance {
                l += 1
            }

            result += r - l
        }

        return result
    }

    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()

        var l = 0
        var r = nums[nums.count - 1] - nums[0]
        while l < r {
            let m = (l + r) / 2

            let pairsCount = calcPairs(nums, m)
            if pairsCount < k {
                l = m + 1
            } else {
                r = m
            }
        }

        return l
    }
}
