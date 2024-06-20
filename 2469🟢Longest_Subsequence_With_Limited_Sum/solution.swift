class Solution {
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        let nums = nums.sorted()
        var sums = Array(repeating: 0, count: nums.count + 1)
        var curSum = 0
        for i in 0 ..< nums.count {
            curSum += nums[i]
            sums[i + 1] = curSum
        }

        return queries.map { query in
            var l = 0
            var r = nums.count
            while l < r {
                let m = (l + r + 1) / 2
                if sums[m] <= query {
                    l = m
                } else {
                    r = m - 1
                }
            }

            return l
        }
    }
}
