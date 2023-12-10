class Solution {
    private func pow(_ a: Int, _ b: Int, _ mod: Int) -> Int {
        guard b > 1 else { return a % mod }
        let halfPow = pow(a, b / 2, mod)
        return halfPow * halfPow * (b % 2 == 1 ? a : 1) % mod
    }

    func getGoodIndices(_ variables: [[Int]], _ target: Int) -> [Int] {
        variables
            .enumerated()
            .filter {
                let a = $0.element[0]
                let b = $0.element[1]
                let c = $0.element[2]
                let m = $0.element[3]

                return target == pow(pow(a, b, 10), c, m)
            }
            .map(\.offset)
    }
}
