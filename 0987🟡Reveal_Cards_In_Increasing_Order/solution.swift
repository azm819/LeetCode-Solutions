class Solution {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        let deck = deck.sorted()
        var result = Array(repeating: Int.zero, count: deck.count)
        var resultCount = 0
        var ind = 0
        var insert = true
        while resultCount < deck.count {
            if result[ind] == .zero {
                if insert {
                    result[ind] = deck[resultCount]
                    resultCount += 1
                }
                insert.toggle()
            }

            ind += 1
            ind %= deck.count
        }
        return result
    }
}

