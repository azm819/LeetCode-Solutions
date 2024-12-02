class Solution {
    func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
        (sentence.split(separator: " ").firstIndex { $0.hasPrefix(searchWord) } ?? -2) + 1
    }
}
