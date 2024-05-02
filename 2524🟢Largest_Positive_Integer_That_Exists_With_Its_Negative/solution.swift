class Solution {
    func findMaxK(_ nums: [Int]) -> Int {
        var numSet = Set<Int>()
        var result = -1
        for num in nums {
            numSet.insert(num)
            if abs(num) > result && numSet.contains(-num) {
                result = abs(num)
            }
        }
        return result
    }
}

