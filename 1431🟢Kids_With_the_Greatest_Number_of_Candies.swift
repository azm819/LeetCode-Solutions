class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let maxCandy = candies.max()!
        return candies.map { $0 + extraCandies >= maxCandy }
    }
}
