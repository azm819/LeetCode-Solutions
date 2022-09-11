class Solution {
    private func isCorrect(_ s: String) -> Bool {
        var ind = s.startIndex
        var count = 0
        while ind != s.endIndex {
            switch s[ind] {
            case "(":
                count += 1
            case ")":
                count -= 1
                if count < .zero {
                    return false
                }
            default: break
            }
            ind = s.index(after: ind)
        }
        return count == .zero
    }

    func removeInvalidParentheses(_ s: String) -> [String] {
        var queue = [String]()
        var visited = Set<String>()

        queue.append(s)
        var result = Set<String>()
        visited.insert(s)

        while !queue.isEmpty {
            let elem = queue.removeFirst()

            if isCorrect(elem) {
                result.insert(elem)
            }
            if !result.isEmpty { continue }

            var ind = elem.startIndex
            while ind != elem.endIndex {
                switch elem[ind] {
                case "(", ")":
                    var e = elem
                    e.remove(at: ind)
                    if !visited.contains(e) {
                        visited.insert(e)
                        queue.append(e)
                    }
                default: break
                }
                ind = elem.index(after: ind)
            }
        }
        return Array(result)
    }
}
