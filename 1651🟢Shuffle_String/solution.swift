class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        var result: [Character] = Array(repeating: " ", count: s.count)
        for (char, index) in zip(s, indices) {
            result[index] = char
        }
        return String(result)
    }
}

