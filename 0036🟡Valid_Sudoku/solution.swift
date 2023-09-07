class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowSets = Array(repeating: Set<Character>(), count: 9)
        var columnSets = Array(repeating: Set<Character>(), count: 9)
        var boxSets = Array(repeating: Set<Character>(), count: 9)
        for i in 0 ... 8 {
            for j in 0 ... 8 where board[i][j] != "." {
                if !rowSets[i].insert(board[i][j]).inserted ||
                   !columnSets[j].insert(board[i][j]).inserted ||
                   !boxSets[(i / 3) * 3 + (j / 3)].insert(board[i][j]).inserted {
                    return false
                }
            }
        }
        return true
    }
}
