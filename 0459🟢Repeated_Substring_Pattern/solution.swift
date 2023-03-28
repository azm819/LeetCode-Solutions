class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        guard s.count > 1 else { return false }
        let s = Array(s)
        var cur = [Character]()
        for ch in s {
            cur.append(ch)
            if cur.count > s.count / 2 {
                return false
            }
            if s.count % cur.count != 0 {
                continue
            }
            var tmp = [Character]()
            let mul = s.count / cur.count
            for _ in 0..<mul {
                tmp += cur
            }
            if tmp == s {
                return true
            }
        }
        return false
    }
}
