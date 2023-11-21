class Solution {
    func countNicePairs(_ nums: [Int]) -> Int {
        var counts = [Int: Int]()
        var result = 0
        // i + rj == j + ri
        // i == j + ri - rj
        // i - ri == j - rj
        for num in nums {
            let key = num - num.reversed
            result = (result + counts[key, default: .zero]) % 1_000_000_007
            counts[key, default: .zero] += 1
        }
        return result
    }
}

private extension Int {
    var reversed: Int {
        var num = self
        var reversedNum = 0
        while num > .zero {
            reversedNum = reversedNum * 10 + num % 10
            num /= 10
        }
        return reversedNum
    }
}
