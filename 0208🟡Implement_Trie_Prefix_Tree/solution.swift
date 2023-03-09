class Trie {
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

    func search(_ word: String) -> Bool {
        var curNode = root
        for ch in word {
            if let next = curNode.next[ch] {
                curNode = next
            } else {
                return false
            }
        }
        return curNode.isTerminate
    }

    func startsWith(_ prefix: String) -> Bool {
        var curNode = root
        for ch in prefix {
            if let next = curNode.next[ch] {
                curNode = next
            } else {
                return false
            }
        }
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
