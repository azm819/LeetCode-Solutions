class Solution {
    func reverseWords(_ s: String) -> String {
        s.split(separator: " ")
            .reversed()
            .joined(separator: " ")
    }
}

