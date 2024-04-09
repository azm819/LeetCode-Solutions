class Solution {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        var result = 0
        for i in 0 ..< k {
            result += min(tickets[i], tickets[k])
        }
        result += tickets[k]
        for i in k + 1 ..< tickets.count {
            result += min(tickets[i], tickets[k] - 1)
        }
        return result
    }
}
