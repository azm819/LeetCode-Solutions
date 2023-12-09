class Solution {
    private final class Node {
        var value: String?
        var nexts = [Character: Node]()
    }

    private func dfs(
        _ i: Int,
        _ j: Int,
        _ node: Node,
        _ board: [[Character]],
        _ visited: inout [[Bool]],
        _ result: inout Set<String>
    ) {
        guard i >= .zero, i < board.count,
                j >= .zero, j < board[0].count,
                !visited[i][j],
                let nextNode = node.nexts[board[i][j]] else {
            return
        }
        if let value = nextNode.value {
            result.insert(value)
        }
        visited[i][j] = true
        dfs(i + 1, j, nextNode, board, &visited, &result)
        dfs(i - 1, j, nextNode, board, &visited, &result)
        dfs(i, j + 1, nextNode, board, &visited, &result)
        dfs(i, j - 1, nextNode, board, &visited, &result)
        visited[i][j] = false
    }

    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let startNode = Node()
        for word in words {
            var curNode = startNode
            for ch in word {
                let nextNode = curNode.nexts[ch, default: Node()]
                curNode.nexts[ch] = nextNode
                curNode = nextNode
            }
            curNode.value = word
        }
        var result = Set<String>()
        var visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        for i in 0 ..< board.count {
            for j in 0 ..< board[0].count {
                dfs(i, j, startNode, board, &visited, &result)
            }
        }
        return Array(result)
    }
}
