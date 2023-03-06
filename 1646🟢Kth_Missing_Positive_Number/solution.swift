class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var lastNum = 0
        var curK = 0
        for int in arr {
            let diff = int - lastNum - 1
            curK += diff
            if curK >= k {
                return lastNum + (diff - (curK - k))
            }
            lastNum = int
        }
        return lastNum + (k - curK)
    }
}
