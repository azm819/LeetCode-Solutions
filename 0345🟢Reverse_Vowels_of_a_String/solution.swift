class Solution {
    func reverseVowels(_ s: String) -> String {
        var vowelsStack = s.filter(\.isVowel)
        var result = ""
        for ch in s {
            result.append(ch.isVowel ? vowelsStack.removeLast() : ch)
        }
        return result
    }
}

private extension Character {
    var isVowel: Bool {
        self == "a" || self == "e" || self == "i" || self == "o" || self == "u" ||
        self == "A" || self == "E" || self == "I" || self == "O" || self == "U"
    }
}

