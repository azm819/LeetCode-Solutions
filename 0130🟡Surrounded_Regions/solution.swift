class Solution {
    func solve(_ board: inout [[Character]]) {
        var queue = [(Int, Int)]()
        for i in 0 ..< board.count {
            if board[i][0] == "O" {
                queue.append((i, 0))
            }
            if board[i][board[0].count - 1] == "O" {
                queue.append((i, board[0].count - 1))
            }
        }
        if board[0].count > 2 {
            for j in 1 ..< board[0].count - 1 {
                if board[0][j] == "O" {
                    queue.append((0, j))
                }
                if board[board.count - 1][j] == "O" {
                    queue.append((board.count - 1, j))
                }
            }
        }
        while let (i, j) = queue.popLast() {
            board[i][j] = "P"
            if i - 1 >= .zero && board[i - 1][j] == "O" {
                queue.append((i - 1, j))
            }
            if i + 1 < board.count && board[i + 1][j] == "O" {
                queue.append((i + 1, j))
            }
            if j - 1 >= .zero && board[i][j - 1] == "O" {
                queue.append((i, j - 1))
            }
            if j + 1 < board[0].count && board[i][j + 1] == "O" {
                queue.append((i, j + 1))
            }
        }
        for i in 0 ..< board.count {
            for j in 0 ..< board[0].count {
                if board[i][j] == "P" {
                    board[i][j] = "O"
                } else {
                    board[i][j] = "X"
                }
            }
        }
    }
}
