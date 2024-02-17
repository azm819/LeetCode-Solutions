class Solution {
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        var queue = [Int]()
        var prevHeight = heights.first!
        var usedBricks = 0
        var result = -1
        for height in heights {
            let diff = height - prevHeight
            if diff > .zero {
                queue.append(diff)
                if queue.count > 1 {
                    var ind = queue.count - 1
                    while ind > .zero {
                        if queue[ind - 1] < queue[ind] {
                            queue.swapAt(ind - 1, ind)
                        } else {
                            break
                        }
                        ind -= 1
                    }
                }

                if queue.count > ladders {
                    usedBricks += queue.removeLast()
                }
                if usedBricks > bricks {
                    break
                }
            }
            result += 1
            prevHeight = height
        }
        return result
    }
}

