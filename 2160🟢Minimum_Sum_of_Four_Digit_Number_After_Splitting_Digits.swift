class Solution {
    func minimumSum(_ num: Int) -> Int {
        var num = num
        var digits = [Int]()
        while num > .zero {
            digits.append(num % 10)
            num /= 10
        }
        digits.sort()
        return (digits[0] + digits[1]) * 10 + digits[2] + digits[3]
    }
}

