class Solution {
    private func isPolydrome(_ s: [Character]) -> Bool {
        var a = 0
        var b = s.count - 1
        while a < b {
            if s[a] != s[b] { return false }
            a += 1
            b -= 1
        }
        return true
    }

    private func part(_ s: String, _ ind: String.Index, _ result: inout [[[Character]]]) {
        guard ind < s.endIndex else { return }
        let ch = s[ind]
        var resA = [[[Character]]]()
        for i in 0..<result.count {
            let lastInd = result[i].count - 1
            let last = result[i][lastInd]
            if isPolydrome(last) {
                resA.append(result[i] + [[ch]])
            }
            result[i][lastInd].append(ch)
        }
        result += resA
        part(s, s.index(after: ind), &result)
    }

    func partition(_ s: String) -> [[String]] {
        var result = [[[s[s.startIndex]]]]
        part(s, s.index(after: s.startIndex), &result)
        var res = [[String]]()
        for r in result where isPolydrome(r.last!) {
            res.append(r.map { String($0) })
        }
        return res
    }
}
