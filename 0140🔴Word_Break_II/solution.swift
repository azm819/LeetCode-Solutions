class Solution {
    private final class Node {
        var isTerminate = false
        var next: [Character: Node] = [:]
    }

    private let root = Node()

    private func insert(_ word: String) {
        var curNode = root
        for ch in word {
            if let next = curNode.next[ch] {
                curNode = next
            } else {
                let next = Node()
                curNode.next[ch] = next
                curNode = next
            }
        }
        curNode.isTerminate = true
    }

    private func backtrack(
        _ ind: String.Index,
        _ s: String,
        _ node: Node,
        _ word: inout [Character],
        _ sentence: inout [[Character]],
        _ result: inout [String]
    ) {
        guard ind != s.endIndex else {
            if word.isEmpty {
                result.append(sentence.map { String($0) }.joined(separator: " "))
            }
            return
        }

        guard let nextNode = node.next[s[ind]] else {
            return
        }

        word.append(s[ind])
        defer {
            word.removeLast()
        }

        if nextNode.isTerminate {
            sentence.append(word)
            defer {
                sentence.removeLast()
            }
            var newWord = [Character]()
            backtrack(s.index(after: ind), s, root, &newWord, &sentence, &result)
        }

        backtrack(s.index(after: ind), s, nextNode, &word, &sentence, &result)
    }

    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        for word in wordDict {
            insert(word)
        }
        
        var word = [Character]()
        var sentence = [[Character]]()
        var result = [String]()
        backtrack(s.startIndex, s, root, &word, &sentence, &result)
        return result
    }
}
