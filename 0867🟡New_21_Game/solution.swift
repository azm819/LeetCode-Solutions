class Solution {
    func new21Game(_ n: Int, _ k: Int, _ maxPts: Int) -> Double {
        var probs = Array(repeating: Double.zero, count: max(n, k + maxPts) + 1)
        probs[0] = 1
        let atomicProb: Double = 1 / Double(maxPts)
        for i in 0..<k {
            let prob = probs[i] * atomicProb
            for j in 1...maxPts {
                probs[i + j] += prob
            }
        }
        var beforeN: Double = .zero
        var afterN: Double = .zero
        for i in k..<probs.count {
            if i <= n {
                beforeN += probs[i]
            } else {
                afterN += probs[i]
            }
        }
        return beforeN / (beforeN + afterN)
    }
}

