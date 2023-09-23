class Solution {
    private func isNeigh(_ s: String, _ t: String) -> Bool {
        var skipped = false
        var tInd = t.startIndex
        for ch in s {
            while tInd != t.endIndex {
                if ch == t[tInd] {
                    tInd = t.index(after: tInd)
                    break
                } else if skipped {
                    return false
                } else {
                    skipped = true
                    tInd = t.index(after: tInd)
                }
            }
        }
        return true
    }

    func longestStrChain(_ words: [String]) -> Int {
        var countWords = Array(repeating: [String](), count: 16)
        for word in words {
            countWords[word.count - 1].append(word)
        }
        var result = 1
        var queue = [("", 0)]
        for countWord in countWords {
            var newQueue = [(String, Int)]()
            for word in countWord {
                var subRes = 1
                for (prevWord, count) in queue where isNeigh(prevWord, word) {
                    subRes = max(subRes, count + 1)
                }
                result = max(result, subRes)
                newQueue.append((word, subRes))
            }
            queue = newQueue
        }
        return result
    }
}
