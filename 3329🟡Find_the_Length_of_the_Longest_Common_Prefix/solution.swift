class Solution {
    private final class Node {
        var next: [Int: Node] = [:]
    }

    func longestCommonPrefix(_ arr1: [Int], _ arr2: [Int]) -> Int {
        var trie = Node()
        for digitsNum in arr1.map(\.digits) {
            var curNode = trie
            for digit in digitsNum {
                if let nextNode = curNode.next[digit] {
                    curNode = nextNode
                } else {
                    let newNode = Node()
                    curNode.next[digit] = newNode
                    curNode = newNode
                }
            }
        }

        var result: Int = .zero

        for digitsNum in arr2.map(\.digits) {
            var curRes: Int = .zero

            var curNode = trie
            for digit in digitsNum {
                if let nextNode = curNode.next[digit] {
                    curNode = nextNode
                    curRes += 1
                } else {
                    break
                }
            }

            result = max(result, curRes)
        }

        return result
    }
}

private extension Int {
    var digits: [Int] {
        var num = self
        var digits = [Int]()
        while num > .zero {
            digits.append(num % 10)
            num /= 10
        }

        return digits.reversed()
    }
}

