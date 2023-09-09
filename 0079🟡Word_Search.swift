class Solution {
    private struct Pair: Hashable {
        let i: Int
        let j: Int
    }

    private func exist(
        _ board: [[Character]],
        _ word: String,
        _ index: String.Index,
        _ i: Int,
        _ j: Int,
        _ visited: inout Set<Pair>
    ) -> Bool {
        guard i >= .zero && i < board.count &&
              j >= .zero && j < board[0].count &&
              board[i][j] == word[index] else {
            return false
        }
        let pair = Pair(i: i, j: j)
        guard !visited.contains(pair) else { return false }
        visited.insert(pair)
        defer {
            visited.remove(pair)
        }
        let nextIndex = word.index(after: index)
        guard nextIndex != word.endIndex else { return true }
        return exist(board, word, nextIndex, i - 1, j, &visited) ||
               exist(board, word, nextIndex, i + 1, j, &visited) ||
               exist(board, word, nextIndex, i, j - 1, &visited) ||
               exist(board, word, nextIndex, i, j + 1, &visited)
    }

    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var visited = Set<Pair>()
        for i in 0 ..< board.count {
            for j in 0 ..< board[0].count {
                if exist(board, word, word.startIndex, i, j, &visited) {
                    return true
                }
            }
        }
        return false
    }
}

