class Solution {
    func isValid(_ s: String) -> Bool {
        var ind = s.startIndex
        var stack = [Character]()
        while ind != s.endIndex {
            switch s[ind] {
            case ")":
                let last = stack.popLast()
                if last != "(" { return false }
            case "}":
                let last = stack.popLast()
                if last != "{" { return false }
            case "]":
                let last = stack.popLast()
                if last != "[" { return false }
            default: stack.append(s[ind])
            }
            ind = s.index(after: ind)
        }
        return stack.isEmpty
    }
}
