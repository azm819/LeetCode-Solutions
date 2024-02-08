class Solution {
    private static let components: [Int] = {
        var components = [Int]()
        var i = 1
        while true {
            let square = i * i
            if square <= 10_000 {
                components.append(square)
            } else {
                break
            }
            i += 1
        }
        return components
    }()

    private static var memo = Array(repeating: [Int: Int](), count: components.count)

    private static func dp(
        _ ind: Int,
        _ n: Int
    ) -> Int {
        guard n > .zero else {
            return 0
        }
        guard ind < components.count && components[ind] <= n else {
            return 10_001
        }
        if let mem = memo[ind][n] {
            return mem
        }
        var result = dp(ind + 1, n)
        for count in 1 ... n / components[ind] {
            result = min(result, count + dp(ind + 1, n - count * components[ind]))
        }
        memo[ind][n] = result
        return result
    }

    func numSquares(_ n: Int) -> Int {
        Solution.dp(.zero, n)
    }
}
