class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var num = num
        var result = 0
        while num > .zero {
            if num % 2 == .zero {
                num /= 2
            } else {
                num -= 1
            }
            result += 1
        }
        return result
    }
}

