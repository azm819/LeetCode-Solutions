class Solution {
    func reverseWords(_ s: String) -> String {
        s.split(separator: " ")
            .map(String.init)
            .map { $0.reversed() }
            .map(String.init)
            .joined(separator: " ")
    }
}
