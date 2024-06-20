class Solution {
    func targetIndices(_ nums: [Int], _ target: Int) -> [Int] {
        let nums = nums.sorted()
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let c = (l + r) / 2
            if nums[c] == target {
                var beg = c
                while beg > .zero && nums[beg - 1] == target {
                    beg -= 1
                }
                var end = c
                while end < nums.count - 1 && nums[end + 1] == target {
                    end += 1
                }
                return Array(beg ... end)
            } else if nums[c] < target {
                l = c + 1
            } else {
                r = c - 1
            }
        }

        return []
    }
}

