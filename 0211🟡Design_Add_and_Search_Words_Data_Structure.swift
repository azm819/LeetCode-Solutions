class WordDictionary {
    class Node {
        var isDeterminate = false
        var children = [Character: Node]()
    }

    private let root = Node()

    func addWord(_ word: String) {
        var cur = root
        for ch in word {
            if let next = cur.children[ch] {
                cur = next
            } else {
                let next = Node()
                cur.children[ch] = next
                cur = next
            }
        }
        cur.isDeterminate = true
    }

    func search(_ word: String, _ curNode: Node? = nil) -> Bool {
        var cur = curNode ?? root
        var ind = 0
        for ch in word {
            ind += 1
            if ch == "." {
                let newWord = String(word.dropFirst(ind))
                for (_, child) in cur.children {
                    if search(newWord, child) {
                        return true
                    }
                }
                return false
            }
            if let next = cur.children[ch] {
                cur = next
            } else {
                return false
            }
        }
        return cur.isDeterminate
    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */
