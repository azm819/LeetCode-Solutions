class Solution {
    func findPermutationDifference(_ s: String, _ t: String) -> Int {
        var indices = [Character: Int]()
        for (ind, ch) in s.enumerated() {
            indices[ch] = ind
        }
        
        var result = 0
        for (ind, ch) in t.enumerated() {
            result += abs(indices[ch]! - ind)
        }

        return result
    }
}
