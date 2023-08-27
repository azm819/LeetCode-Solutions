class Solution {
    private static func binSearch(_ nums: [Int], _ target: Int) -> Bool {
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let c = (l + r) / 2
            if nums[c] == target {
                return true
            } else if nums[c] > target {
                r = c - 1
            } else {
                l = c + 1
            }
        }
        return false
    }

    private static func dp(
        _ cur: Int,
        _ prevJump: Int,
        _ target: Int,
        _ stones: [Int],
        _ visited: inout [Int: Set<Int>]
    ) -> Bool {
        if cur == target {
            return true
        }
        guard binSearch(stones, cur) else {
            return false
        }
        if let visitedJumps = visited[cur], visitedJumps.contains(prevJump) {
            return false
        }
        visited[cur, default: Set()].insert(prevJump)
        if prevJump > 1 && dp(cur + prevJump - 1, prevJump - 1, target, stones, &visited) ||
           dp(cur + prevJump, prevJump, target, stones, &visited) ||
           dp(cur + prevJump + 1, prevJump + 1, target, stones, &visited) {
            return true
        }
        return false
    }

    func canCross(_ stones: [Int]) -> Bool {
        var visited = [Int: Set<Int>]()
        return Solution.dp(stones.first! + 1, 1, stones.last!, stones, &visited)
    }
}
