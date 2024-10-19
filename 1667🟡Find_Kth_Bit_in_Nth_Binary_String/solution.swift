class Solution {
    private static var counts: [Int] = [1]

    private func calcCount(_ n: Int) -> Int {
        if n > Solution.counts.count {
            Solution.counts.append(2 * calcCount(n - 1) + 1)
        }

        return Solution.counts[n - 1]
    }

    func findKthBit(_ n: Int, _ k: Int) -> Character {
        guard n > 1 else {
            return "0"
        }

        let nCount = calcCount(n)
        if k <= nCount / 2 {
            return findKthBit(n - 1, k)
        } else if k == nCount / 2 + 1 {
            return "1"
        } else {
            return findKthBit(n - 1, nCount - k + 1) == "0" ? "1" : "0"
        }
    }
}
