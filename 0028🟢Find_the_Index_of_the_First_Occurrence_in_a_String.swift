class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count > needle.count else {
            if haystack == needle {
                return .zero
            }
            return -1
        }
        var result = 0
        var indH = haystack.startIndex
        var oldIndexes = [String.Index]()
        while indH < haystack.endIndex {
            if oldIndexes.contains(needle.endIndex) {
                return result - needle.count
            }
            var newIndexes = oldIndexes.filter { needle[$0] == haystack[indH] }
            if needle[needle.startIndex] == haystack[indH] {
                newIndexes.append(needle.startIndex)
            }
            oldIndexes = newIndexes.map { needle.index(after: $0) }
            result += 1
            indH = haystack.index(after: indH)
        }
        if oldIndexes.contains(needle.endIndex) {
            return result - needle.count
        }
        oldIndexes.removeAll()
        return -1
    }
}
