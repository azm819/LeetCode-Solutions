class Solution {
    private static var ones = [0, 1, 1, 2]

    func countBits(_ n: Int) -> [Int] {
        while n >= Solution.ones.count {
            let prevCount = Solution.ones.count
            for i in 0 ..< prevCount {
                Solution.ones.append(Solution.ones[i] + 1)
            }
        }

        return Array(Solution.ones[...n])
    }
}
