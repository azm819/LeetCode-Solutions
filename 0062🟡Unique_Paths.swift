class Solution {
    struct Pair: Hashable {
        let x: Int
        let y: Int

        static func == (lhs: Pair, rhs: Pair) -> Bool {
            lhs.x == rhs.x && lhs.y == rhs.y || lhs.y == rhs.x && lhs.x == rhs.y
        }
    }

    private var comb = [Pair: Int]()

    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 1 && n > 1 else { return 1 }
        var result = 0
        let f = Pair(x: m - 1, y: n)
        let s = Pair(x: m, y: n - 1)
        if let c = comb[f] {
            result += c
        } else {
            result += uniquePaths(m - 1, n)
        }
        if let c = comb[s] {
            result += c
        } else {
            result += uniquePaths(m, n - 1)
        }
        comb[Pair(x: m, y: n)] = result
        return result
    }
}
