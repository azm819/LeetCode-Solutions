class Solution {
    private func updateDistances(
        _ cur: Int,
        _ neighbours: [Int: [(neighbour: Int, distance: Int)]],
        _ threshold: Int,
        _ distance: Int,
        _ distances: inout [Int]
    ) {
        guard distance <= threshold, distances[cur] > distance else {
            return
        }

        distances[cur] = distance
        for (neighbour, edgeDistance) in neighbours[cur, default: []] {
            updateDistances(neighbour, neighbours, threshold, distance + edgeDistance, &distances)
        }
    }

    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        var neighbours: [Int: [(neighbour: Int, distance: Int)]] = [:]
        for edge in edges where edge[2] <= distanceThreshold {
            neighbours[edge[0], default: []].append((edge[1], edge[2]))
            neighbours[edge[1], default: []].append((edge[0], edge[2]))
        }

        var result = n - 1
        var reachableCount: Int = .max
        for city in 0 ..< n {
            var distances = Array(repeating: Int.max, count: n)
            updateDistances(city, neighbours, distanceThreshold, .zero, &distances)
            var count: Int = .zero
            for neighbourDistance in distances where neighbourDistance <= distanceThreshold {
                count += 1
            }
            if count <= reachableCount {
                result = city
                reachableCount = count
            }
        }

        return result
    }
}
