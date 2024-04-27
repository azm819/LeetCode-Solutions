class Solution {
    private func check(_ cells: [Character]) -> Bool {
        var bCount = 0
        var wCount = 0
        for cell in cells {
            if cell == "B" {
                bCount += 1
            } else {
                wCount += 1
            }
        }
        return bCount <= 1 || wCount <= 1
    }

    func canMakeSquare(_ grid: [[Character]]) -> Bool {
        check([grid[0][0], grid[0][1], grid[1][0], grid[1][1]]) ||
        check([grid[0][1], grid[0][2], grid[1][1], grid[1][2]]) ||
        check([grid[1][0], grid[1][1], grid[2][0], grid[2][1]]) ||
        check([grid[1][1], grid[1][2], grid[2][1], grid[2][2]])
    }
}


