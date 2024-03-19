class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        guard n > .zero else { return tasks.count }
        var counts = [Character: Int]()
        var maxCount = 0
        for task in tasks {
            let newCount = counts[task, default: .zero] + 1
            counts[task] = newCount
            maxCount = max(maxCount, newCount)
        }
        maxCount -= 1
        var result = (n + 1) * maxCount
        var places = result
        for count in counts.values {
            let available = min(count, min(maxCount, places))
            places -= available
            result += count - available
        }
        return result
    }
}
