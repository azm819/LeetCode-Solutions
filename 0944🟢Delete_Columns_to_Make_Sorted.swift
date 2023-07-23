class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        var prev = Array(repeating: Character("a"), count: strs[0].count)
        var shouldBeDeleted = Array(repeating: false, count: strs[0].count)
        var result = 0
        for str in strs {
            let chars = Array(str)
            for i in 0 ..< chars.count where !shouldBeDeleted[i] {
                if prev[i] <= chars[i] {
                    prev[i] = chars[i]
                } else {
                    shouldBeDeleted[i] = true
                    result += 1
                }
            }
        }
        return result
    }
}
