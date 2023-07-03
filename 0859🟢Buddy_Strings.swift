class Solution {
    func buddyStrings(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else { return false }
        var ind = s.startIndex
        var swapped = false
        var swappedChS: Character?
        var swappedChG: Character?
        var chars = [Character: Int]()
        while ind != s.endIndex {
            if s[ind] != goal[ind] {
                if swapped {
                    return false
                }
                if swappedChS != nil {
                    if swappedChS == goal[ind] && swappedChG == s[ind] {
                        swapped = true
                    } else {
                        return false
                    }
                } else {
                    swappedChS = s[ind]
                    swappedChG = goal[ind]
                }
            } else {
                chars[s[ind], default: .zero] += 1
            }
            ind = s.index(after: ind)
        }
        return swapped || swappedChS == nil && chars.values.contains { $0 > 1 }
    }
}
