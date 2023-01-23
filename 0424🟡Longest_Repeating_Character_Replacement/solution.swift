class Solution {
    private func isValid(_ s: String, _ k: Int, _ c: Int) -> Bool {
        var from = s.startIndex
        var to = s.index(s.startIndex, offsetBy: c - 1)
        var map = [Character: Int]()
        while from <= to {
            map[s[from]] = (map[s[from]] ?? .zero) + 1
            from = s.index(after: from)
        }
        from = s.startIndex
        var ch: Character? = nil
        var max = 0
        while true {
            if ch == nil {
                map.forEach {
                    if $1 > max {
                        ch = $0
                        max = $1
                    }
                }
            }
            if max + k >= c { return true }

            map[s[from]] = (map[s[from]] ?? .zero) - 1
            if ch == s[from] {
                ch = nil
            }
            from = s.index(after: from)

            to = s.index(after: to)
            if to == s.endIndex { break }
            map[s[to]] = (map[s[to]] ?? .zero) + 1
            if ch != s[to] {
                ch = nil
            } else {
                max += 1
            }
        }
        return false
    }

    func characterReplacement(_ s: String, _ k: Int) -> Int {
        if k >= s.count - 1 { return s.count }
        var l = k + 1
        var r = s.count
        while l < r {
            let c = (l + r + 1) / 2
            if isValid(s, k, c) {
                l = c
            } else {
                r = c - 1
            }
        }
        return l
    }
}
