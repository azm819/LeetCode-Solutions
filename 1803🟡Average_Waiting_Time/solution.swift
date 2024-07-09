class Solution {
    func averageWaitingTime(_ customers: [[Int]]) -> Double {
        var waitingTime: Int = .zero
        var currentTime: Int = .zero
        for customer in customers {
            currentTime = max(currentTime, customer[0]) + customer[1]
            waitingTime += currentTime - customer[0]
        }

        return Double(waitingTime) / Double(customers.count)
    }
}

