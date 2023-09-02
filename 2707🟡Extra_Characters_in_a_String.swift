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
        _ memo: inout [String.Index: Int]
    ) -> Int {
        guard ind != word.endIndex else { return .zero }
        if let mem = memo[ind] {
            return mem
        }
        var result = 1 + dp(word, word.index(after: ind), trie, &memo)
        for ind in trie.search(word, ind) {
            result = min(result, dp(word, ind, trie, &memo))
        }
        memo[ind] = result
        return result
    }

    func minExtraChar(_ s: String, _ dictionary: [String]) -> Int {
        var trie = Trie()
        for word in dictionary {
            trie.insert(word)
        }
        var memo = [String.Index: Int]()
        return dp(s, s.startIndex, trie, &memo)
    }
}
