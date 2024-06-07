class Solution {
    private final class Node {
        var isTerminate = false
        var next: [Character: Node] = [:]
    }

    private func insert(_ word: String, _ root: Node) {
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

    private func getShortestPrefix(_ word: Substring, _ root: Node) -> String {
        var curNode = root
        var prefix = ""
        for ch in word {
            if let next = curNode.next[ch] {
                curNode = next
                prefix.append(ch)
                if curNode.isTerminate {
                    return prefix
                }
            } else {
                return ""
            }
        }
        return ""
    }

    func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
        let root = Node()
        for word in dictionary {
            insert(word, root)
        }

        var resultSentence = [String]()
        for word in sentence.split(separator: " ") {
            let prefix = getShortestPrefix(word, root)
            if prefix.isEmpty {
                resultSentence.append(String(word))
            } else {
                resultSentence.append(prefix)
            }
        }
        return resultSentence.joined(separator: " ")
    }
}
