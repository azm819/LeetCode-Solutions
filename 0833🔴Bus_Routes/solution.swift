class Solution {
    func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
        guard source != target else { return .zero }
        guard routes.count > 1 else {
            return routes[0].contains(source) && routes[0].contains(target) ? 1 : -1
        }
        guard routes.count > 2 else {
            let hasS0 = routes[0].contains(source)
            let hasT0 = routes[0].contains(target)
            if hasS0 && hasT0 { return 1 }
            let hasS1 = routes[1].contains(source)
            let hasT1 = routes[1].contains(target)
            if hasS1 && hasT1 { return 1 }
            if (hasS0 && hasT1 || hasS1 && hasT0) && !Set(routes[0]).isDisjoint(with: Set(routes[1])) {
                return 2
            }
            return -1
        }
        var buses = [Int: [Int]]()
        for i in 0..<routes.count {
            for stop in routes[i] {
                buses[stop, default: []].append(i)
            }
        }
        var visited = Set<Int>()
        visited.insert(source)
        var queue = Set<Int>()
        buses[source]?
            .flatMap { routes[$0] }
            .forEach { queue.insert($0) }
        var res = 1
        defer {
            buses.removeAll()
            visited.removeAll()
            queue.removeAll()
        }
        while !queue.isEmpty {
            var newQueue = Set<Int>()
            while let stop = queue.popFirst() {
                if stop == target {
                    return res
                }
                let (inserted, _) = visited.insert(stop)
                if !inserted {
                    continue
                }
                buses[stop]?
                    .flatMap { routes[$0] }
                    .forEach {
                        if !visited.contains($0) {
                            newQueue.insert($0)
                        }
                    }
                buses[stop] = nil
            }
            queue = newQueue

            res += 1
        }
        return -1
    }
}

