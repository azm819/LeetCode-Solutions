class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var l = s.firstIndex(where: \.isLetterOrNumber) ?? s.startIndex
        var r = s.lastIndex(where: \.isLetterOrNumber) ?? s.startIndex
        while l < r {
            if s[l].lowercased() != s[r].lowercased() {
                return false
            }
            l = s.index(after: l)
            while l != s.endIndex && !s[l].isLetterOrNumber {
                l = s.index(after: l)
            }
            r = s.index(before: r)
            while l != s.startIndex && !s[r].isLetterOrNumber {
                r = s.index(before: r)
            }
        }
        return true
    }
}

private extension Character {
    var isLetterOrNumber: Bool {
        isLetter || isNumber
    }
}

