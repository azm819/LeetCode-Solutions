class Solution {
    func minimumSteps(_ s: String) -> Int {
        var onesCount: Int = .zero
        var result: Int = .zero
        for ch in s {
            if ch == "0" {
                result += onesCount
            } else {
                onesCount += 1
            }
        }

        return result
    }
}

