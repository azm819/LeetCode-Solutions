class Solution {
    func appendCharacters(_ s: String, _ t: String) -> Int {
        var sInd = s.startIndex
        var tInd = t.startIndex
        while sInd != s.endIndex && tInd != t.endIndex {
            if s[sInd] == t[tInd] {
                tInd = t.index(after: tInd)
            }
            sInd = s.index(after: sInd)
        }

        return t.distance(from: tInd, to: t.endIndex)
    }
}
