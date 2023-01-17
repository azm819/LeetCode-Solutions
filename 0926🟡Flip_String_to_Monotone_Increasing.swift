class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        var zero = 0
        var one = 0
        for c in s {
            if c == "0" {
                one = min(one, zero) + 1
            } else if c == "1" {
                one = min(one, zero)
                zero += 1
            }
        }
        return min(zero, one)
    }
}
