class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var l = 0
        var r = numbers.count - 1
        while l < r {
            let sum = numbers[l] + numbers[r]
            if sum == target {
                return [l + 1, r + 1]
            } else if sum > target {
                r -= 1
            } else {
                l += 1
            }
        }
        return [-1, -1]
    }
}
