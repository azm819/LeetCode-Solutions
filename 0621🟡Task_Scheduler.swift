class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        guard n > .zero else { return tasks.count }
        var map = [Character: Int]()
        var maximum = 0
        for task in tasks {
            map[task] = map[task, default: .zero] + 1
            maximum = max(maximum, map[task]!)
        }
        maximum -= 1
        var result = (n + 1) * maximum
        var places = result
        for value in map.values {
            let ava = min(value, min(maximum, places))
            places -= ava
            result += value - ava
        }
        map.removeAll()
        return result
    }
}
