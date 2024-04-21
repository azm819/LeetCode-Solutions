class Solution {
    func numberOfSpecialChars(_ word: String) -> Int {
        var lowercasedSet = Set<Character>()
        var uppercasedSet = Set<Character>()
        var resultSet = Set<Character>()
        for ch in word {
            if ch.isLowercase {
                lowercasedSet.insert(ch)
                if resultSet.contains(ch.uppercased()) {
                    resultSet.remove(ch.uppercased().first!)
                }
            } else {
                if uppercasedSet.insert(ch).inserted && lowercasedSet.contains(ch.lowercased()) {
                    resultSet.insert(ch)
                }
            }
        }
        return resultSet.count
    }
}
