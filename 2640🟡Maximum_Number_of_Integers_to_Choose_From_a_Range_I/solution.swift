class Solution {
    func maxCount(_ banned: [Int], _ n: Int, _ maxSum: Int) -> Int {
        var bannedSet = Set<Int>()
        for num in banned where num <= n {
            bannedSet.insert(num)
        }

        var curSum: Int = .zero
        var result: Int = .zero
        for num in 1 ... n where !bannedSet.contains(num) {
            if curSum + num <= maxSum {
                curSum += num
                result += 1
            } else {
                return result
            }
        }

        return result
    }
}

