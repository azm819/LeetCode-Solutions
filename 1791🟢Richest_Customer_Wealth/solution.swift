class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        accounts.map { $0.reduce(into: 0, { $0 = $0 + $1 }) }.max()!
    }
}
