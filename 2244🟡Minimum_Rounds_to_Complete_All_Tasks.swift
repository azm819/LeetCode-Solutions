class Solution {
    func minimumRounds(_ tasks: [Int]) -> Int {
        var tasksCounts = [Int: Int]()
        for task in tasks {
            tasksCounts[task, default: .zero] += 1
        }
        var result = 0
        for count in tasksCounts.values {
            if count == 1 {
                return -1
            }
            if count % 3 == .zero {
                result += count / 3
            } else {
                result += count / 3 + 1
            }
        }
        return result
    }
}
