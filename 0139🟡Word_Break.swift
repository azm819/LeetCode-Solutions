class Solution {
    private class Trie {
        private final class Node {
            var isTerminate = false
            var next: [Character: Node] = [:]
        }

        private var root = Node()

        func insert(_ word: String) {
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

        func search(_ word: String, _ ind: String.Index) -> [String.Index] {
            var curNode = root
            var ind = ind
            var result = [String.Index]()
            while ind != word.endIndex {
                if let next = curNode.next[word[ind]] {
                    ind = word.index(after: ind)
                    curNode = next
                    if curNode.isTerminate {
                        result.append(ind)
                    }
                } else {
                    break
                }
            }
            return result
        }
    }

    private func dp(
        _ word: String,
        _ ind: String.Index,
        _ trie: Trie,
        _ memo: inout Set<String.Index>
    ) -> Bool {
        guard ind != word.endIndex else { return true }
        guard !memo.contains(ind) else { return false }
        for ind in trie.search(word, ind) {
            if dp(word, ind, trie, &memo) { return true }
        }
        memo.insert(ind)
        return false
    }

    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var trie = Trie()
        for word in wordDict {
            trie.insert(word)
        }
        var memo = Set<String.Index>()
        return dp(s, s.startIndex, trie, &memo)
    }
}
