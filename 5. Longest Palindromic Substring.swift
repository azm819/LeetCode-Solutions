class Solution {
    func isPolynome(_ s: [Character], _ a: Int, _ b: Int) -> Bool {
        guard a < b else {
            return true
        }
        
        return s[a] == s[b] && isPolynome(s, a + 1, b - 1)
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
