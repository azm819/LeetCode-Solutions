class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var arr = Array(repeating: 0, count: n)
        for tr in trust {
            arr[tr[0] - 1] -= 1
            arr[tr[1] - 1] += 1
        }
        var res: Int?
        for i in 0 ..< n where arr[i] == n - 1 {
            if res == nil {
                res = i + 1
            } else {
                return -1
            }
        }
        return res ?? -1
    }
}
