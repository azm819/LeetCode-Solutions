class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        for i in 0 ..< board.count {
            for j in 0 ..< board[0].count {
                var count = 0
                if i - 1 >= .zero && j - 1 >= .zero && board[i - 1][j - 1] % 2 == 1 { count += 1 }
                if i - 1 >= .zero && board[i - 1][j] % 2 == 1 { count += 1 }
                if i - 1 >= .zero && j + 1 < board[0].count && board[i - 1][j + 1] % 2 == 1 { count += 1 }
                if j - 1 >= .zero && board[i][j - 1] % 2 == 1 { count += 1 }
                if j + 1 < board[0].count && board[i][j + 1] % 2 == 1 { count += 1 }
                if i + 1 < board.count && j - 1 >= .zero && board[i + 1][j - 1] % 2 == 1 { count += 1 }
                if i + 1 < board.count && board[i + 1][j] % 2 == 1 { count += 1 }
                if i + 1 < board.count && j + 1 < board[0].count && board[i + 1][j + 1] % 2 == 1 { count += 1 }
                if board[i][j] == .zero {
                    if count == 3 {
                        board[i][j] = 2
                    }
                } else {
                    if count < 2 || count > 3 {
                        board[i][j] = 3
                    }
                }
            }
        }
        for i in 0 ..< board.count {
            for j in 0 ..< board[0].count {
                if board[i][j] == 2 {
                    board[i][j] = 1
                } else if board[i][j] == 3 {
                    board[i][j] = 0
                }
            }
        }
    }
}

