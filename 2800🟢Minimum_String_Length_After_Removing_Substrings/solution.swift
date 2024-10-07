class Solution {
    func minLength(_ s: String) -> Int {
        var stack = [Character]()
        for ch in s {
            if ch == "B" && stack.last == "A" {
                stack.removeLast()
            } else if ch == "D" && stack.last == "C" {
                stack.removeLast()
            } else {
                stack.append(ch)
            }
        }

        return stack.count
    }
}

