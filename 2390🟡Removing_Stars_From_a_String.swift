class Solution {
    func removeStars(_ s: String) -> String {
        s.reduce(into: "", { stack, ch in
            if ch == "*" {
                stack.removeLast()
            } else {
                stack.append(ch)
            }
        })
    }
}
