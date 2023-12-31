class Solution {
    func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
        var result = -1
        var startPositions = [Character: String.Index]()
        var ind = s.startIndex
        while ind != s.endIndex {
            if let position = startPositions[s[ind]] {
                result = max(result, s.distance(from: position, to: ind) - 1)
            } else {
                startPositions[s[ind]] = ind
            }
            ind = s.index(after: ind)
        }
        return result
    }
}

