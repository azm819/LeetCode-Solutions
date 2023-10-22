class Solution {
    func maximumScore(_ nums: [Int], _ k: Int) -> Int {
        var mins = nums
        var ind = k
        var curMin = nums[k]
        while ind >= .zero {
            curMin = min(nums[ind], curMin)
            mins[ind] = curMin
            ind -= 1
        }
        ind = k
        curMin = nums[k]
        while ind < nums.count {
            curMin = min(nums[ind], curMin)
            mins[ind] = curMin
            ind += 1
        }
        var result = nums[k]
        for curMin in min(mins.first!, mins.last!) ... nums[k] {
            var l = 0
            var r = k
            while l < r {
                let c = (l + r) / 2
                if mins[c] < curMin {
                    l = c + 1
                } else {
                    r = c
                }
            }
            let leftInd = l
            l = k
            r = nums.count - 1
            while l < r {
                let c = (l + r + 1) / 2
                if mins[c] < curMin {
                    r = c - 1
                } else {
                    l = c
                }
            }
            let rightInd = l
            result = max(result, (rightInd - leftInd + 1) * curMin)
        }
        return result
    }
}

