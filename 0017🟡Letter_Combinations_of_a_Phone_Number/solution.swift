class Solution {
    private func dp(_ digits: String, _ ind: String.Index) -> [[Character]] {
        guard ind != digits.endIndex else { return [[]] }

        let next = dp(digits, digits.index(after: ind))

        let curLetters: [Character]
        switch digits[ind] {
        case "2":
            curLetters = ["a", "b", "c"]
        case "3":
            curLetters = ["d", "e", "f"]
        case "4":
            curLetters = ["g", "h", "i"]
        case "5":
            curLetters = ["j", "k", "l"]
        case "6":
            curLetters = ["m", "n", "o"]
        case "7":
            curLetters = ["p", "q", "r", "s"]
        case "8":
            curLetters = ["t", "u", "v"]
        case "9":
            curLetters = ["w", "x", "y", "z"]
        default:
            curLetters = []
        }

        var result = [[Character]]()
        for letter in curLetters {
            for subRes in next {
                result.append([letter] + subRes)
            }
        }

        return result
    }

    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        return dp(digits, digits.startIndex).map { String($0) }
    }
}

