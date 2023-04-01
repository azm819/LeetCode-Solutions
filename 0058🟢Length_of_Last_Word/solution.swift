class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var ind = s.endIndex
        while ind != s.startIndex {
            ind = s.index(before: ind)
            if s[ind] != " " {
                break
            }
        }
        var cnt = 0
        while ind != s.startIndex {
            ind = s.index(before: ind)
            if s[ind] == " " {
                break
            }
            cnt += 1
        }
        return cnt + 1
    }
}
