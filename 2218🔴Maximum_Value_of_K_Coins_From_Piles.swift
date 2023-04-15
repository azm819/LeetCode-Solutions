class Solution {
    func maxValueOfCoins(_ piles: [[Int]], _ k: Int) -> Int {
        var dp = Array(repeating: 0, count: k + 1)
        for pile in piles {
            var newDP = Array(repeating: 0, count: k + 1)
            var prefSums = Array(repeating: 0, count: k + 1)
            for coin in 1...k {
                if coin <= pile.count {
                    prefSums[coin] = prefSums[coin - 1] + pile[coin - 1]
                } else {
                    prefSums[coin] = prefSums[coin - 1]
                }
                for i in 0...coin {
                    newDP[coin] = max(newDP[coin], dp[coin - i] + prefSums[i])
                }
            }
            dp = newDP
        }
        return dp[k]
    }
}
