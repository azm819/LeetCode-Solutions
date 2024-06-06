class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        guard hand.count % groupSize == .zero else {
            return false
        }

        var counts = [Int: Int]()
        for card in hand {
            counts[card, default: .zero] += 1
        }

        for card in counts.keys.sorted() {
            while counts[card]! > .zero {
                var nextCard = card
                while nextCard - card < groupSize {
                    guard let count = counts[nextCard], count > .zero else {
                        return false
                    }

                    counts[nextCard] = count - 1
                    nextCard += 1
                }
            }
        }

        return true
    }
}

