class Solution {
    func minimumDeletions(_ s: String) -> Int {
        var totalACount: Int = .zero
        for ch in s where ch == "a" {
            totalACount += 1
        }

        var result = totalACount
        var leftACount: Int = .zero
        var charCount: Int = .zero
        for ch in s {
            charCount += 1
            if ch == "a" {
                leftACount += 1
            }
            let bToDelete = charCount - leftACount
            let aToDelete = totalACount - leftACount
            result = min(result, bToDelete + aToDelete)
        }

        return result
    }
}
