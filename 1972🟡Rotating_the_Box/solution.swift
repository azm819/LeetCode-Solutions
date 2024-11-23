class Solution {
    func rotateTheBox(_ box: [[Character]]) -> [[Character]] {
        var rotatedBox: [[Character]] = Array(repeating: Array(repeating: ".", count: box.count), count: box[0].count)

        for i in 0 ..< box.count {
            var stonesCount = 0
            for j in 0 ..< box[i].count {
                switch box[i][j] {
                case ".":
                    break
                case "#":
                    stonesCount += 1
                case "*":
                    rotatedBox[j][box.count - 1 - i] = "*"
                    var ind = j - 1
                    while stonesCount > .zero {
                        rotatedBox[ind][box.count - 1 - i] = "#"
                        stonesCount -= 1
                        ind -= 1
                    }
                default:
                    fatalError()
                }
            }

            var ind = box[i].count - 1
            while stonesCount > .zero {
                rotatedBox[ind][box.count - 1 - i] = "#"
                stonesCount -= 1
                ind -= 1
            }
        }

        return rotatedBox
    }
}
