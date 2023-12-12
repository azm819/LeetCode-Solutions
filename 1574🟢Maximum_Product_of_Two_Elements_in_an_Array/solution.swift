class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var a: Int = .min
        var b: Int = .min
        for num in nums {
            if num > a {
                b = a
                a = num
            } else if num > b {
                b = num
            }
        }
        return (a - 1) * (b - 1)
    }
}
