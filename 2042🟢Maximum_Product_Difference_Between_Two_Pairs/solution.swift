class Solution {
    func maxProductDifference(_ nums: [Int]) -> Int {
        var a: Int = .min
        var b: Int = .min
        var c: Int = .max
        var d: Int = .max
        for num in nums {
            if num > a {
                b = a
                a = num
            } else if num > b {
                b = num
            }

            if num < c {
                d = c
                c = num
            } else if num < d {
                d = num
            }
        }
        return a * b - c * d
    }
}

