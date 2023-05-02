class Solution {
    func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
        var l = 1
        var r = nums.max()!
        while l < r {
            let c = (l + r) / 2
            let sum = nums.reduce(into: 0) { partialResult, num in
                partialResult += (num + c - 1) / c
            }
            if sum > threshold {
                l = c + 1
            } else {
                r = c
            }
        }
        return l
    }
}
