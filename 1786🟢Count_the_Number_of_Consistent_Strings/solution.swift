class Solution {
    func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
        let allowedCharacters = Set(allowed)
        return words
            .filter { word in
                word.allSatisfy { character in
                    allowedCharacters.contains(character)
                }
            }.count
    }
}
