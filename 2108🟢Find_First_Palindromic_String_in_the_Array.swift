class Solution {
    func firstPalindrome(_ words: [String]) -> String {
        words.first(where: \.isPalindrome) ?? ""
    }
}

private extension String {
    var isPalindrome: Bool {
        var l = startIndex
        var r = index(before: endIndex)
        while l < r {
            if self[l] != self[r] {
                return false
            }
            l = index(after: l)
            r = index(before: r)
        }
        return true
    }
}

