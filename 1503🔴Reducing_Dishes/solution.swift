class Solution {
    func maxSatisfaction(_ satisfaction: [Int]) -> Int {
        let satisfaction = satisfaction.sorted(by: >)
        var elemSum = 0
        var lastSum = 0
        for num in satisfaction {
            elemSum += num
            if elemSum > 0 {
                lastSum += elemSum
            } else {
                break
            }
        }
        return lastSum
    }
}
