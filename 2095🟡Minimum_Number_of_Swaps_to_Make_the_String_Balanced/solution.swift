class Solution {
    func minSwaps(_ s: String) -> Int {
        var count: Int = .zero
        var result: Int = .zero
        for ch in s {
            if ch == "[" {
                count += 1
            } else {
                if count > .zero {
                    count -= 1
                } else {
                    result += 1
                }
            }
        }

        return (result + 1) / 2
    }
}

