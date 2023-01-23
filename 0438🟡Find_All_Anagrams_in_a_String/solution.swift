private extension Optional where Wrapped == Int {
    func increased() -> Int {
        switch self {
        case .none:
            return 1
        case .some(let wrapped):
            return wrapped + 1
        }
    }

    func decreased() -> Int? {
        switch self {
        case .none:
            return nil
        case .some(let wrapped):
            let r = wrapped - 1
            return r == .zero ? nil : r
        }
    }
}

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        guard p.count <= s.count else { return [] }
        var to = p.startIndex
        var sMap = [Character: Int]()
        var pMap = [Character: Int]()
        while to < p.endIndex {
            sMap[s[to]] = sMap[s[to]].increased()
            pMap[p[to]] = pMap[p[to]].increased()
            to = p.index(after: to)
        }
        var i = 0
        var result = [Int]()
        if sMap == pMap {
            result.append(i)
        }
        var from = s.startIndex
        while to < s.endIndex {
            sMap[s[from]] = sMap[s[from]].decreased()
            sMap[s[to]] = sMap[s[to]].increased()
            i += 1
            print(i)
            print(sMap)
            if sMap == pMap {
                result.append(i)
            }
            from = s.index(after: from)
            to = s.index(after: to)
        }
        return result
    }
}
