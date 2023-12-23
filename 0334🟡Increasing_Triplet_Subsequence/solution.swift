class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var a: Int = .max
        var b: Int = .max
        for num in nums {
            if num < a {
                a = num
            } else if num > a && num < b {
                b = num
            } else if num > b {
                return true
            }
        }
        return false
    }
}

