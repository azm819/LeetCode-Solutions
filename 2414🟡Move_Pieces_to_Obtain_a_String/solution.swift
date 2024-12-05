class Solution {
    func canChange(_ start: String, _ target: String) -> Bool {
        var startInd = start.startIndex
        var targetInd = target.startIndex
        while startInd != start.endIndex || targetInd != target.endIndex {
            while startInd != start.endIndex && start[startInd] == "_" {
                startInd = start.index(after: startInd)
            }
            while targetInd != target.endIndex && target[targetInd] == "_" {
                targetInd = target.index(after: targetInd)
            }

            if startInd == start.endIndex || targetInd == target.endIndex {
                return startInd == start.endIndex && targetInd == target.endIndex
            }

            if start[startInd] != target[targetInd] ||
                start[startInd] == "L" && startInd < targetInd ||
                start[startInd] == "R" && startInd > targetInd {
                return false
            }

            startInd = start.index(after: startInd)
            targetInd = target.index(after: targetInd)
        }

        return true
    }
}
