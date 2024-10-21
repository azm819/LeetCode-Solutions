class Solution {
    private func backtrace(
        _ ind: String.Index,
        _ str: String,
        _ curSubstring: inout String,
        _ curSplit: inout Set<String>
    ) -> Int {
        guard ind != str.endIndex else {
            if curSplit.insert(curSubstring).inserted {
                defer {
                    curSplit.remove(curSubstring)
                }
                return curSplit.count
            }
            return .zero
        }

        var result: Int = .zero
        if curSplit.insert(curSubstring).inserted {
            var newSubstring = String(str[ind])
            result = max(result, backtrace(str.index(after: ind), str, &newSubstring, &curSplit))
            curSplit.remove(curSubstring)
        }

        curSubstring.append(str[ind])
        defer {
            curSubstring.removeLast()
        }
        return max(result, backtrace(str.index(after: ind), str, &curSubstring, &curSplit))
    }

    func maxUniqueSplit(_ s: String) -> Int {
        var curSubstring = String(s.first!)
        var curSplit = Set<String>()
        return backtrace(s.index(after: s.startIndex), s, &curSubstring, &curSplit)
    }
}
