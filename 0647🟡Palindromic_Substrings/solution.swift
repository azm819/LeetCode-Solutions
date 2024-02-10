class Solution {
    func countSubstrings(_ s: String) -> Int {
        guard s.count > 1 else { return 1 }

        var index = s.index(after: s.startIndex)
        var result = 1
        while index != s.endIndex {
            var left = index
            var right = index
            while right != s.endIndex && s[left] == s[right] {
                result += 1
                if left != s.startIndex {
                    left = s.index(before: left)
                } else {
                    break
                }
                right = s.index(after: right)
            }

            left = s.index(before: index)
            right = index
            while right != s.endIndex && s[left] == s[right] {
                result += 1
                if left != s.startIndex {
                    left = s.index(before: left)
                } else {
                    break
                }
                right = s.index(after: right)
            }

            index = s.index(after: index)
        }
        return result
    }
}
