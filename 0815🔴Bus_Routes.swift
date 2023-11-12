class Solution {
    func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
        var buses = [Int: [Int]]()
        for i in 0 ..< routes.count {
            for stop in routes[i] {
                buses[stop, default: []].append(i)
            }
        }

        var result = 0
        var queue = [source]
        var visitedStops: Set<Int> = [source]
        var visitedBuses: Set<Int> = []
        while !queue.isEmpty {
            var newQueue = [Int]()
            for stop in queue {
                if stop == target {
                    return result
                }
                for bus in buses[stop, default: []] where !visitedBuses.contains(bus) {
                    for next in routes[bus] where !visitedStops.contains(next) {
                        newQueue.append(next)
                        visitedStops.insert(stop)
                    }
                    visitedBuses.insert(bus)
                }
            }
            result += 1
            queue = newQueue
        }
        return -1
    }
}
