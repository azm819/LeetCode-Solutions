class Solution {
    private static func convert(_ char: Character) -> Int {
        switch char {
        case "a": return 0
        case "b": return 1
        case "c": return 2
        case "d": return 3
        case "e": return 4
        case "f": return 5
        case "g": return 6
        case "h": return 7
        case "i": return 8
        case "j": return 9
        case "k": return 10
        case "l": return 11
        case "m": return 12
        case "n": return 13
        case "o": return 14
        case "p": return 15
        case "q": return 16
        case "r": return 17
        case "s": return 18
        case "t": return 19
        case "u": return 20
        case "v": return 21
        case "w": return 22
        case "x": return 23
        case "y": return 24
        case "z": return 25
        default: fatalError()
        }
    }

    private func dp(_ ind: Int, _ positions: [Int], _ k: Int, _ prevPosition: Int?, _ memo: inout [[Int: Int]]) -> Int {
        guard ind < positions.count else {
            return .zero
        }

        guard let prevPosition = prevPosition else {
            return max(
                dp(ind + 1, positions, k, nil, &memo),
                dp(ind + 1, positions, k, positions[ind], &memo) + 1
            )
        }

        if let mem = memo[ind][prevPosition] {
            return mem
        }

        guard abs(prevPosition - positions[ind]) <= k else {
            return dp(ind + 1, positions, k, prevPosition, &memo)
        }

        let result = max(
            dp(ind + 1, positions, k, prevPosition, &memo),
            dp(ind + 1, positions, k, positions[ind], &memo) + 1
        )
        memo[ind][prevPosition] = result
        return result
    }

    func longestIdealString(_ s: String, _ k: Int) -> Int {
        let positions = s.map(Solution.convert(_:))
        var memo = Array(repeating: [Int: Int](), count: positions.count)
        return dp(.zero, positions, k, nil, &memo)
    }
}
