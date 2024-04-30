class Solution {
    func wonderfulSubstrings(_ word: String) -> Int {
        let firstAsciiValue = Character("a").asciiValue!
        
        var maskCount = [Int: Int]()
        var curMask = 0
        maskCount[curMask, default: .zero] += 1
        var result = 0
        for char in word {
            let offset = char.asciiValue! - firstAsciiValue
            curMask ^= 1 << offset
            
            result += maskCount[curMask, default: .zero]
            maskCount[curMask, default: .zero] += 1 // number of substrings with the same mask

            for i in 0 ..< 10 {
                result += maskCount[curMask ^ (1 << i), default: .zero] // number of substrings with a mask that differs in one position
            }
        }

        return result
    }
}
