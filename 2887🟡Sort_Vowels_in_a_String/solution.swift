class Solution {
    func sortVowels(_ s: String) -> String {
        var vowels = [Character]()
        for ch in s where ch.isVowel {
            vowels.append(ch)
        }
        vowels.sort(by: >)

        var result = ""
        for ch in s {
            if ch.isVowel {
                result.append(vowels.removeLast())
            } else {
                result.append(ch)
            }
        }
        return result
    }
}

private extension Character {
    var isVowel: Bool {
        switch self.lowercased() {
        case "a", "e", "i", "o", "u": return true
        default: return false
        }
    }
}
