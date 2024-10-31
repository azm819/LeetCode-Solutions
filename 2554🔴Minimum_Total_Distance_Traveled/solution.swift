class Solution {
    func minimumTotalDistance(
        _ robotInd: Int,
        _ factoryInd: Int,
        _ robots: [Int],
        _ factories: inout [(position: Int, limit: Int)],
        _ cache: inout [[Int: [Int: Int]]]
    ) -> Int {
        guard robotInd < robots.count else {
            return .zero
        }

        guard factoryInd < factories.count else {
            return .max
        }

        if let cached = cache[robotInd][factoryInd]?[factories[factoryInd].limit] {
            return cached
        }

        var result = minimumTotalDistance(robotInd, factoryInd + 1, robots, &factories, &cache)
        if factories[factoryInd].limit > .zero {
            factories[factoryInd].limit -= 1
            let subRes = minimumTotalDistance(robotInd + 1, factoryInd, robots, &factories, &cache)
            if subRes != .max {
                result = min(result, abs(factories[factoryInd].position - robots[robotInd]) + subRes)
            }
            factories[factoryInd].limit += 1
        }

        cache[robotInd][factoryInd, default: [:]][factories[factoryInd].limit] = result

        return result
    }

    func minimumTotalDistance(_ robot: [Int], _ factory: [[Int]]) -> Int {
        let robots = robot.sorted()
        var factories = factory.map { (position: $0[0], limit: $0[1]) }.sorted { $0.position < $1.position }
        var cache = Array(repeating: [Int: [Int: Int]](), count: robots.count)

        return minimumTotalDistance(.zero, .zero, robots, &factories, &cache)
    }
}
