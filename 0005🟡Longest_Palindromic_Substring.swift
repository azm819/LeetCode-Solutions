class Solution {
    struct Pair: Hashable {
        let first: Int
        let second: Int

        init(_ f: Int, _ s: Int) {
            first = f
            second = s
        }
    }
    
    var falseSet = Set<Pair>()
    
    func isPolynome(_ s: [Character], _ a: Int, _ b: Int) -> Bool {
        guard !falseSet.contains(Pair(a, b)) else {
            return false
        }
        
        guard a < b else {
            return true
        }
        
        let res = s[a] == s[b] && isPolynome(s, a + 1, b - 1)
        
        if !res {
            falseSet.insert(Pair(a, b))
        }
        
        return res
    }
    
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        let string = Array(s)
        
        for d in 0..<string.count {
            let size = string.count - d
            for i in 0...string.count - size {
                let j = i + size - 1
                if isPolynome(string, i, j) {
                    return String(string[i...j])
                }
            }
        }
        return ""
    }
}
