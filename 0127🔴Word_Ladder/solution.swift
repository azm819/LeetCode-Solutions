class Solution {
    private func hasOneDiff(_ lhs: String, _ rhs: String) -> Bool {
        var hasChanges = false
        var ind = lhs.startIndex
        while ind != lhs.endIndex {
            if lhs[ind] != rhs[ind] {
                if hasChanges {
                    return false
                }
                hasChanges = true
            }
            ind = lhs.index(after: ind)
        }
        return hasChanges
    }

    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordSet = Set(wordList)
        guard wordSet.contains(endWord) else { return .zero }
        var steps = 1
        var queue = [beginWord]
        while !queue.isEmpty {
            var newQueue = [String]()
            for word in queue {
                if word == endWord {
                    return steps
                }

                for nextWord in wordSet where hasOneDiff(word, nextWord) {
                    wordSet.remove(nextWord)
                    newQueue.append(nextWord)
                }
            }
            steps += 1
            queue = newQueue
        }
        return .zero
    }
}
