class Solution {
    static let characters: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    private func updateCost(
        _ from: Character,
        _ to: Character,
        _ cost: Int,
        _ rules: [Character: [Character: Int]],
        _ costs: inout [Character: [Character: Int]]
    ) {
        guard cost < (costs[from]?[to] ?? .max) else {
            return
        }

        costs[from, default: [:]][to] = cost
        for (to, toCost) in rules[to, default: [:]] {
            updateCost(from, to, cost + toCost, rules, &costs)
        }
    }

    func minimumCost(_ source: String, _ target: String, _ original: [Character], _ changed: [Character], _ cost: [Int]) -> Int {
        var rules: [Character: [Character: Int]] = [:]
        for i in 0 ..< original.count {
            if let savedCost = rules[original[i]]?[changed[i]], savedCost < cost[i] {
                continue
            }
            rules[original[i], default: [:]][changed[i]] = cost[i]
        }

        var costs: [Character: [Character: Int]] = [:]
        for char in Solution.characters {
            updateCost(char, char, .zero, rules, &costs)
        }

        var result: Int = .zero
        var ind = source.startIndex
        while ind != source.endIndex {
            if let cost = costs[source[ind]]?[target[ind]] {
                result += cost
            } else {
                return -1
            }
            ind = source.index(after: ind)
        }
        return result
    }
}
