class Solution {
    private func getDistance(
        _ i: Int,
        _ j: Int,
        _ word1: [Character],
        _ word2: [Character],
        _ distances: inout [[Int]]
    ) -> Int {
        guard i > 0 && j > 0 else { return max(i, j) }
        guard distances[i][j] == -1 else { return distances[i][j] }
        if word1[i - 1] == word2[j - 1] {
            distances[i][j] = getDistance(i - 1, j - 1, word1, word2, &distances)
        } else {
            distances[i][j] = min(
                min(
                    getDistance(i, j - 1, word1, word2, &distances),
                    getDistance(i - 1, j, word1, word2, &distances)
                ),
                getDistance(i - 1, j - 1, word1, word2, &distances)
            ) + 1
        }
        return distances[i][j]
    }

    func minDistance(_ word1: String, _ word2: String) -> Int {
        guard word1 != word2 else { return .zero }
        guard !word1.isEmpty && !word2.isEmpty else { return max(word1.count, word2.count) }
        var distances = Array(repeating: Array(repeating: -1, count: word2.count + 1), count: word1.count + 1)
        return getDistance(word1.count, word2.count, Array(word1), Array(word2), &distances)
    }
}
