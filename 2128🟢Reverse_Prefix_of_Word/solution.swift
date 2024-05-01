class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        guard let index = word.firstIndex(of: ch) else {
            return word
        }
        return String(word.prefix(through: index).reversed()) + String(word.suffix(from: word.index(after: index)))
    }
}

