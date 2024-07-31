class Solution {
    private func minHeightShelves(
        _ from: Int,
        _ books: [[Int]],
        _ shelfWidth: Int,
        _ memo: inout [Int?]
    ) -> Int {
        guard from < books.count else {
            return .zero
        }

        if let mem = memo[from] {
            return mem
        }

        var curWidth = shelfWidth
        var shelfHeight: Int = .zero
        var totalHeight: Int = .max
        var cur = from
        while cur < books.count && books[cur][0] <= curWidth {
            shelfHeight = max(shelfHeight, books[cur][1])
            totalHeight = min(totalHeight, shelfHeight + minHeightShelves(cur + 1, books, shelfWidth, &memo))

            curWidth -= books[cur][0]
            cur += 1
        }

        totalHeight = min(totalHeight, shelfHeight + minHeightShelves(cur, books, shelfWidth, &memo))
        memo[from] = totalHeight
        return totalHeight
    }

    func minHeightShelves(_ books: [[Int]], _ shelfWidth: Int) -> Int {
        var memo = Array(repeating: Int?.none, count: books.count)
        return minHeightShelves(.zero, books, shelfWidth, &memo)
    }
}
