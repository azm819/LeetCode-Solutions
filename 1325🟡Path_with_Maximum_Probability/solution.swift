class Solution {
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
        var neighbours = [Int: [(Int, Double)]]()
        for i in 0 ..< edges.count {
            neighbours[edges[i][0], default: []].append((edges[i][1], succProb[i]))
            neighbours[edges[i][1], default: []].append((edges[i][0], succProb[i]))
        }
        var probs = Array(repeating: Double.zero, count: n)
        probs[start] = 1
        var queue = [start]
        var inQueue = Array(repeating: false, count: n)
        while let cur = queue.popLast() {
            inQueue[cur] = false
            var updated = false
            for (neigh, prob) in neighbours[cur, default: []] {
                let newProb = probs[cur] * prob
                if newProb > probs[neigh] {
                    probs[neigh] = newProb
                    updated = true
                    if !inQueue[neigh] {
                        queue.append(neigh)
                    }
                }
            }
            if updated {
                queue.sort { probs[$0] < probs[$1] }
            }
        }
        return probs[end]
    }
}

