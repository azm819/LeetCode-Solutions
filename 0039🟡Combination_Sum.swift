class Solution {
    private func combinationSum(
        _ candidates: Set<Int>,
        _ target: Int,
        _ lastSum: Int = .zero,
        _ lastChosen: Int = .zero,
        _ lastRes: [Int] = []
    ) -> [[Int]] {
        var result = [[[Int]]]()
        for candidate in candidates where candidate >= lastChosen && lastSum + candidate <= target {
            result.append(combinationSum(candidates, target, lastSum + candidate, candidate, lastRes + [candidate]))
        }
        if result.isEmpty {
            return lastSum == target ? [lastRes] : []
        } else {
            return result.flatMap { $0 }
        }
    }

    func combinationSum(
        _ candidates: [Int],
        _ target: Int
    ) -> [[Int]] {
        combinationSum(Set(candidates), target)
    }
}
