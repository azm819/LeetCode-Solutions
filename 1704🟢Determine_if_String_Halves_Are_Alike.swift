class Solution {
    func halvesAreAlike(_ s: String) -> Bool {
        var curCount = 0
        var ind = s.startIndex
        var first = 0
        var second = 0
        while ind != s.endIndex {
            if s[ind].isVowel {
                if curCount < s.count / 2 {
                    first += 1
                } else {
                    second += 1
                }
            }
            ind = s.index(after: ind)
            curCount += 1
        }
        return first == second
    }
}

private extension Character {
    var isVowel: Bool {
        self == "a" || self == "e" || self == "i" || self == "o" || self == "u" || self == "A" || self == "E" || self == "I" || self == "O" || self == "U"
    }
}
