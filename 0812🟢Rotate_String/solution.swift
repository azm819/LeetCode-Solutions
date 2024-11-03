class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else {
            return false
        }

        var goalArray = Array(goal)
        for i in 0 ..< goalArray.count {
            var sInd = s.startIndex
            var goalInd = i
            while sInd != s.endIndex {
                if goalArray[goalInd] == s[sInd] {
                    goalInd = (goalInd + 1) % goalArray.count
                    sInd = s.index(after: sInd)
                } else {
                    break
                }
            }

            if sInd == s.endIndex {
                return true
            }
        }

        return false
    }
}

