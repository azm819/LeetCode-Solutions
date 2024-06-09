class Solution {
    func truncateSentence(_ s: String, _ k: Int) -> String {
        s.split(separator: " ")[..<k].joined(separator: " ")
    }
}

