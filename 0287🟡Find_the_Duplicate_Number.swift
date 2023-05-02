class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var l = 1
        var r = nums.count - 1
        while l < r {
            let c = (l + r) / 2
            var count = 0
            for num in nums where num <= c {
                count += 1
            }
            if count > c {
                r = c
            } else {
                l = c + 1
            }
        }
        return l
    }
}

