class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        var sA = [Character]()
        var sInd = s.startIndex
        while sInd < s.endIndex {
            if s[sInd] == "#" {
                sA.popLast()
            } else {
                sA.append(s[sInd])
            }
            sInd = s.index(after: sInd)
        }
        var tA = [Character]()
        var tInd = t.startIndex
        while tInd < t.endIndex {
            if t[tInd] == "#" {
                tA.popLast()
            } else {
                tA.append(t[tInd])
            }
            tInd = t.index(after: tInd)
        }
        return sA == tA
    }
}
