class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        var balance = 0
        var result = 0
        for ch in s {
            if ch == "L" {
                balance -= 1
            } else {
                balance += 1
            }
            if balance == .zero {
                result += 1
            }
        }
        return result
    }
}

