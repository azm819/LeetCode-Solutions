class Solution {
    private final class Trie {
        private final class Node {
            var curCount: Int = .zero
            private(set) var totalCount: Int = .zero
            var nexts: [Character: Node] = [:]
            var updatedTime = 0

            func markEnding() {
                totalCount += 1
                curCount += 1
            }
        }

        private let start = Node()
        private var curSearch: Node?
        private var updatingTime = 0

        func insert(_ word: String) {
            var curNode = start
            for ch in word {
                if let node = curNode.nexts[ch] {
                    curNode = node
                } else {
                    let newNode = Node()
                    curNode.nexts[ch] = newNode
                    curNode = newNode
                }
            }
            curNode.markEnding()
        }

        func check(_ sym: Character) -> Bool {
            curSearch = curSearch ?? start

            guard let node = curSearch?.nexts[sym] else {
                curSearch = nil
                return false
            }
            curSearch = node
            return true
        }

        func markUsed() -> Bool {
            if updatingTime > curSearch!.updatedTime {
                curSearch?.updatedTime = updatingTime
                curSearch?.curCount = curSearch!.totalCount
            }
            guard curSearch!.curCount > .zero else {
                curSearch = nil
                return false
            }
            curSearch?.curCount -= 1
            curSearch = nil
            return true
        }

        func updateUsage() {
            updatingTime += 1
        }
    }

    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let n = words[0].count
        let m = words.count
        guard s.count >= n * m else { return [] }

        let trie = Trie()
        for word in words {
            trie.insert(word)
        }

        var result = [Int]()
        let str = Array(s)
        for i in 0 ..< str.count - n * m + 1 {
            var isPart = true
            for j in 0 ..< m {
                for k in 0 ..< n {
                    if !trie.check(str[i + j * n + k]) {
                        isPart = false
                        break
                    }
                }
                if !isPart {
                    break
                }
                if !trie.markUsed() {
                    isPart = false
                    break
                }
            }
            if isPart {
                result.append(i)
            }
            trie.updateUsage()
        }
        return result
    }
}
