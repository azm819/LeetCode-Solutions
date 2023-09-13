class Solution {
    func candy(_ ratings: [Int]) -> Int {
        guard ratings.count > 1 else { return 1 }
        var candies = Array(repeating: 1, count: ratings.count)
        for i in 1 ..< ratings.count {
            if ratings[i] > ratings[i - 1] {
                candies[i] = candies[i - 1] + 1
            }
        }
        for i in stride(from: ratings.count - 2, through: .zero, by: -1) {
            if ratings[i] > ratings[i + 1] {
                candies[i] = max(candies[i], candies[i + 1] + 1)
            }
        }
        return candies.reduce(.zero, +)
    }
}
