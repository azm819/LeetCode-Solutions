class Solution {
    func findWordsContaining(_ words: [String], _ x: Character) -> [Int] {
        words
            .enumerated()
            .filter { $0.element.contains(x) }
            .map(\.offset)
    }
}
