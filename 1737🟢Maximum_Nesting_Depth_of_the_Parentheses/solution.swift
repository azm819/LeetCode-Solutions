class Solution {
    func maxDepth(_ s: String) -> Int {
        var counter = 0
        var result = 0
        for ch in s {
            if ch == "(" {
                counter += 1
                result = max(result, counter)
            } else if ch == ")" {
                counter -= 1
            }
        }
        return result
    }
}
