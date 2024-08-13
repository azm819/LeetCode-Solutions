class Solution {
    private func calcCombinations(
        _ ind: Int,
        _ candidates: [Int],
        _ target: Int,
        _ comb: inout [Int],
        _ result: inout [[Int]]
    ) {
        guard target > .zero else {
            result.append(comb)
            return
        }

        guard ind < candidates.count else {
            return
        }

        for i in ind ..< candidates.count where target >= candidates[i] {
            if i == ind || candidates[i] != candidates[i - 1] {
                comb.append(candidates[i])
                calcCombinations(i + 1, candidates, target - candidates[i], &comb, &result)
                comb.removeLast()
            }
        }
    }

    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var candidates = candidates.sorted()
        while let last = candidates.last, last > target {
            candidates.removeLast()
        }

        var result = [[Int]]()
        var comb = [Int]()
        calcCombinations(.zero, candidates, target, &comb, &result)
        return Array(result)
    }
}
