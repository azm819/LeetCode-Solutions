class Solution {
    func maxCoins(_ piles: [Int]) -> Int {
        let piles = piles.sorted(by: >)
        var result = 0
        for i in 0 ..< piles.count / 3 {
            result += piles[i * 2 + 1]
        }
        return result
    }
}
