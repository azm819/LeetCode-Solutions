class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        var counts1 = [Character: Int]()
        for char in word1 {
            counts1[char, default: .zero] += 1
        }
        var counts2 = [Character: Int]()
        for char in word2 {
            counts2[char, default: .zero] += 1
        }
        return counts1.keys == counts2.keys && counts1.values.sorted() == counts2.values.sorted()
    }
}

