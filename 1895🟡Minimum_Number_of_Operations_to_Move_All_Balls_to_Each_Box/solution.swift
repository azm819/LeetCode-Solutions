class Solution {
    func minOperations(_ boxes: String) -> [Int] {
        var result = Array(repeating: Int.zero, count: boxes.count)

        var moves = 0
        var balls = 0
        var ind = 0
        for box in boxes {
            moves += balls
            result[ind] = moves
            if box == "1" {
                balls += 1
            }
            ind += 1
        }

        moves = 0
        balls = 0
        ind = result.count - 1
        for box in boxes.reversed() {
            moves += balls
            result[ind] += moves
            if box == "1" {
                balls += 1
            }
            ind -= 1
        }

        return result
    }
}

