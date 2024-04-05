class Solution {
    func makeGood(_ s: String) -> String {
        var stack = [Character]()
        for ch in s {
            if let last = stack.last, last.isLowercase != ch.isLowercase, last.lowercased() == ch.lowercased() {
                stack.removeLast()
            } else {
                stack.append(ch)
            }
        }
        return String(stack)
    }
}

