class Solution {
    private final class Node {
        var value: Int = .zero
        var next: [Character: Node] = [:]
    }

    func sumPrefixScores(_ words: [String]) -> [Int] {
        let trie = Node()

        for word in words {
            var curNode = trie
            for ch in word {
                if let nextNode = curNode.next[ch] {
                    curNode = nextNode
                } else {
                    let newNode = Node()
                    curNode.next[ch] = newNode
                    curNode = newNode
                }

                curNode.value += 1
            }
        }

        return words.map { word in
            var result: Int = .zero
            var curNode = trie
            for ch in word {
                curNode = curNode.next[ch]!
                result += curNode.value
            }
            return result
        }
    }
}

