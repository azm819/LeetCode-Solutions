class Solution {
    private func backtrack(
        _ words: [String],
        _ ind: Int,
        _ curCounts: [Character: Int],
        _ totalCounts: [Character: Int],
        _ score: Int,
        _ scores: [Int]
    ) -> Int {
        guard ind < words.count else {
            return score
        }
        var result = backtrack(words, ind + 1, curCounts, totalCounts, score, scores)

        var curCounts = curCounts
        var subRes = 0
        for letter in words[ind] {
            curCounts[letter, default: .zero] += 1
            if curCounts[letter]! > totalCounts[letter]! {
                return result
            }

            subRes += scores[letter.letterIndex]
        }
        return max(result, backtrack(words, ind + 1, curCounts, totalCounts, score + subRes, scores))
    }

    func maxScoreWords(_ words: [String], _ letters: [Character], _ score: [Int]) -> Int {
        var counts = [Character: Int]()
        for letter in letters {
            counts[letter, default: .zero] += 1
        }

        let words = words.filter { word in
            var curCounts = [Character: Int]()
            for letter in word {
                curCounts[letter, default: .zero] += 1
                if curCounts[letter]! > counts[letter, default: .zero] {
                    return false
                }
            }
            return true
        }

        return backtrack(words, .zero, [:], counts, .zero, score)
    }
}

private extension Character {
    static let aLetter: Character = "a"

    var letterIndex: Int {
        Int(asciiValue! - Character.aLetter.asciiValue!)
    }
}

