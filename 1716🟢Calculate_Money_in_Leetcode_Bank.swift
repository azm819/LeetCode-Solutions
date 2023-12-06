class Solution {
    func totalMoney(_ n: Int) -> Int {
        let weeks = n / 7
        var result = (56 + (weeks - 1) * 7) * weeks / 2
        let days = n % 7
        if days > 0 {
            for i in 1 ... days {
                result += weeks + i
            }
        }
        return result
    }
}
