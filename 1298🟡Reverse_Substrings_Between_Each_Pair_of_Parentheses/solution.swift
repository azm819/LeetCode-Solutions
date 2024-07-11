class Solution {
    private func reverseSubstring(_ cur: inout String.Index, _ s: String) -> String {
        guard cur != s.endIndex else { return "" }
        var substring = ""
        while cur != s.endIndex {
            switch s[cur] {
            case "(":
                cur = s.index(after: cur)
                substring += reverseSubstring(&cur, s)
            case ")":
                cur = s.index(after: cur)
                return String(substring.reversed())
            default:
                substring.append(s[cur])
                cur = s.index(after: cur)
            }
        }
        return String(substring.reversed())
    }

    func reverseParentheses(_ s: String) -> String {
        var cur = s.startIndex
        return String(reverseSubstring(&cur, s).reversed())
    }
}

