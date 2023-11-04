class Solution {
    func getLastMoment(_ n: Int, _ left: [Int], _ right: [Int]) -> Int {
        max(
            left.max() ?? .zero,
            right.map { n - $0 }.max() ?? .zero
        )
    }
}
