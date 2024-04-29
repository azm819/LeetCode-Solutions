class Solution {
    private final class Node {
        var terminatingWord: String?
        var next: [Character: Node] = [:]
    }

    private static let chars: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
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
        curNode.terminatingWord = word
    }

    private func getTopThree(_ node: Node?) -> [String] {
        guard let node = node else { return [] }
        
        var result = [String]()
        if let word = node.terminatingWord {
            result.append(word)
        }

        for char in Solution.chars {
            result += getTopThree(node.next[char])
            if result.count >= 3 {
                break
            }
        }

        return Array(result[..<min(result.count, 3)])
    }

    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        products.forEach(insert(_:))
        var curNode: Node? = root
        var result = [[String]]()
        for char in searchWord {
            curNode = curNode?.next[char]
            result.append(getTopThree(curNode))
        }
        return result
    }
}
