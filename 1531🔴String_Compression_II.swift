class Solution {
    private func getLength(_ num: Int) -> Int {
        switch num {
        case 0: return 0
        case 1: return 1
        case 2 ... 9: return 2
        case 10 ... 99: return 3
        default: return 4
        }
    }

    func getLengthOfOptimalCompression(_ s: String, _ k: Int) -> Int {
        let str = Array(s)
        var dp = Array(repeating: Array(repeating: Int.max, count: k + 1), count: str.count + 1)
        dp[0] = Array(repeating: .zero, count: k + 1)

        for i in 0 ..< str.count {
            for j in 0 ... k {
                if j > .zero {
                    dp[i + 1][j] = dp[i][j - 1]
                }
                var removedCount = 0
                var simCount = 0
                var ind = i
                while ind >= .zero {
                    if str[ind] == str[i] {
                        simCount += 1
                    } else {
                        removedCount += 1
                    }
                    guard removedCount <= j else { break }
                    dp[i + 1][j] = min(dp[i + 1][j], dp[ind][j - removedCount] + getLength(simCount))
                    ind -= 1
                }
            }
        }

        return dp.last!.last!
    }
}
