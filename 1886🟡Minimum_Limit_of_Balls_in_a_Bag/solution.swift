class Solution {
    func minimumSize(_ nums: [Int], _ maxOperations: Int) -> Int {
        var l = 1
        var r = nums.max()!
        while l < r {
            let c = (l + r) / 2
            var operations = 0
            for num in nums {
                operations += (num + c - 1) / c - 1
            }
            if operations <= maxOperations {
                r = c
            } else {
                l = c + 1
            }
        }
        return l
    }
}
