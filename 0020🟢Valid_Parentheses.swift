class Solution {
    func isValid(_ s: String) -> Bool {
        var ind = s.startIndex
        var queue = [Character]()
        while ind != s.endIndex {
            switch s[ind] {
            case ")":
                let last = queue.popLast()
                if last != "(" { return false }
            case "}":
                let last = queue.popLast()
                if last != "{" { return false }
            case "]":
                let last = queue.popLast()
                if last != "[" { return false }
            default: queue.append(s[ind])
            }
            ind = s.index(after: ind)
        }
        return queue.isEmpty
    }
}
