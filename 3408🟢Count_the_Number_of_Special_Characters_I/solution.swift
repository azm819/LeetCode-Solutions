class Solution {
    func numberOfSpecialChars(_ word: String) -> Int {
        var lowercasedSet = Set<Character>()
        var uppercasedSet = Set<Character>()
        var result = 0
        for ch in word {
            if ch.isLowercase {
                if lowercasedSet.insert(ch).inserted && uppercasedSet.contains(ch.uppercased()) {
                    result += 1
                }
            } else {
                if uppercasedSet.insert(ch).inserted && lowercasedSet.contains(ch.lowercased()) {
                    result += 1
                }
            }
        }
        return result
    }
}


