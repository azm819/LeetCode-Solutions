class Solution {
    private func ways(
        _ k: Int,
        _ i: Int,
        _ j: Int,
        _ m: Int,
        _ n: Int,
        _ hasAppleHor: [[Bool]],
        _ hasAppleVer: [[Bool]],
        _ memo: inout [[[UInt64?]]]
    ) -> UInt64 {
        if let mem = memo[i][j][k] {
            return mem
        }
        guard k > 1 else {
            for ic in i..<m {
                if hasAppleHor[ic][j] {
                    memo[i][j][k] = 1
                    return 1
                }
            }
            memo[i][j][k] = 0
            return 0
        }
        var result: UInt64 = 0
        let newK = k - 1
        for ic in i..<m {
            if hasAppleHor[ic][j] {
                var ind = ic + 1
                while ind < m {
                    result += ways(newK, ind, j, m, n, hasAppleHor, hasAppleVer, &memo)
                    ind += 1
                }
                break
            }
        }
        for jc in j..<n {
            if hasAppleVer[i][jc] {
                var ind = jc + 1
                while ind < n {
                    result += ways(newK, i, ind, m, n, hasAppleHor, hasAppleVer, &memo)
                    ind += 1
                }
                break
            }
        }
        memo[i][j][k] = result
        return result
    }

    func ways(_ pizza: [String], _ k: Int) -> Int {
        let pizza: [[Character]] = pizza.map { Array($0) }
        let m = pizza.count
        let n = pizza[0].count
        var hasAppleHor = Array(repeating: Array(repeating: false, count: n), count: m)
        var hasAppleVer = Array(repeating: Array(repeating: false, count: n), count: m)
        for i in stride(from: m - 1, through: .zero, by: -1) {
            for j in stride(from: n - 1, through: .zero, by: -1) {
                if pizza[i][j] == "A" {
                    hasAppleHor[i][j] = true
                    hasAppleVer[i][j] = true
                } else {
                    if j < n - 1 {
                        hasAppleHor[i][j] = hasAppleHor[i][j + 1]
                    }
                    if i < m - 1 {
                        hasAppleVer[i][j] = hasAppleVer[i + 1][j]
                    }
                }
            }
        }
        var memo = Array(repeating: Array(repeating: Array(repeating: Optional<UInt64>.none, count: k + 1), count: n), count: m)
        return Int(ways(k, .zero, .zero, m, n, hasAppleHor, hasAppleVer, &memo) % 1000000007)
    }
}
