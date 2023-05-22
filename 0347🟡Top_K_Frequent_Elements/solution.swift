class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freqs = [Int: Int]()
        for num in nums {
            freqs[num, default: .zero] += 1
        }
        return Array(freqs.sorted { (lhs, rhs) in
            lhs.value > rhs.value
        }.map(\.key)[..<k])
    }
}
