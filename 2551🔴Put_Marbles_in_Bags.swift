class Solution {
    func putMarbles(_ weights: [Int], _ k: Int) -> Int {
        guard k > 1 && weights.count > 2 else { return .zero }
        var pairSums = [Int]()
        for i in 0 ..< weights.count - 1 {
            pairSums.append(weights[i] + weights[i + 1])
        }
        pairSums.sort()
        let minDist = pairSums.dropLast(weights.count - k).reduce(0, +)
        let maxDist = pairSums.dropFirst(weights.count - k).reduce(0, +)
        return maxDist - minDist
    }
}
