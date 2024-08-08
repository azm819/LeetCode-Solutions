class Solution {
    private enum Direction {
        case left
        case right
        case up
        case down
    }

    func spiralMatrixIII(_ rows: Int, _ cols: Int, _ rStart: Int, _ cStart: Int) -> [[Int]] {

        var direction: Direction = .right
        var steps = 1
        var curRow = rStart
        var curCol = cStart
        var result: [[Int]] = [[curRow, curCol]]

        let appendCurPosition = { curRow, curCol in
            if .zero ..< rows ~= curRow && .zero ..< cols ~= curCol {
                result.append([curRow, curCol])
            }
        }

        while result.count < rows * cols {
            switch direction {
            case .right:
                var col = curCol + 1
                while col <= curCol + steps {
                    appendCurPosition(curRow, col)
                    col += 1
                }
                curCol += steps

                direction = .down
            case .down:
                var row = curRow + 1
                while row <= curRow + steps {
                    appendCurPosition(row, curCol)
                    row += 1
                }
                curRow += steps

                direction = .left

                steps += 1
            case .left:
                var col = curCol - 1
                while col >= curCol - steps {
                    appendCurPosition(curRow, col)
                    col -= 1
                }
                curCol -= steps

                direction = .up
            case .up:
                var row = curRow - 1
                while row >= curRow - steps {
                    appendCurPosition(row, curCol)
                    row -= 1
                }
                curRow -= steps

                direction = .right

                steps += 1
            }
        }

        return result
    }
}
