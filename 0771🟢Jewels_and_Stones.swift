class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        let jewels = Set(jewels)
        return stones.reduce(into: 0) { partialResult, stone in
            if jewels.contains(stone) { partialResult += 1 }
        }
    }
}
