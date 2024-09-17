class Solution {
    func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
        var allWords = Set<String>()
        var uniqueWords = Set<String>()

        for word in s1.split(separator: " ").map(String.init) {
            if allWords.insert(word).inserted {
                uniqueWords.insert(word)
            } else {
                uniqueWords.remove(word)
            }
        }

        for word in s2.split(separator: " ").map(String.init) {
            if allWords.insert(word).inserted {
                uniqueWords.insert(word)
            } else {
                uniqueWords.remove(word)
            }
        }

        return Array(uniqueWords)
    }
}
