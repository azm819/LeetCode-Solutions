class Solution {
    private func isSub(_ lhs: [Character: Int], _ rhs: [Character: Int]) -> Bool {
        for (ch, cnt) in rhs {
            if lhs[ch, default: .zero] < cnt {
                return false
            }
        }
        return true
    }

    func minWindow(_ s: String, _ t: String) -> String {
        guard s.count >= t.count else { return "" }
        let s = Array(s)
        let t = Array(t)
        let tMap = t.reduce(into: [Character: Int]()) { partialResult, ch in
            partialResult[ch, default: .zero] += 1
        }
        var l = -1
        var r = 0
        var lr = -1
        var rr = -1
        var res = s.count + 1
        var curMap = [Character: Int]()
        while r < s.count {
            curMap[s[r], default: .zero] += 1
            while l <= r && isSub(curMap, tMap) {
                let curLen = r - l
                l += 1
                if curLen < res {
                    res = curLen
                    lr = l
                    rr = r
                }
                curMap[s[l], default: .zero] -= 1
            }
            r += 1
        }
        guard lr != -1 else { return "" }
        return String(s[lr...rr])
    }
}
