class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var arr = Array(repeating: 0, count: n)
        for tr in trust {
            arr[tr[0] - 1] = -n
            arr[tr[1] - 1] += 1
        }
        var res: Int? = nil
        for i in 0..<n {
            if arr[i] == n - 1 {
                if res == nil {
                    res = i + 1
                } else {
                    return -1
                }
            }
        }
        return res == nil ? -1 : res!
    }
}
