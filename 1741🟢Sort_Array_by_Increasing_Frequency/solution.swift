class Solution {
    func frequencySort(_ nums: [Int]) -> [Int] {
        nums
            .reduce(into: [Int: Int]()) { partialResult, num in
                partialResult[num, default: .zero] += 1
            }
            .sorted {
                $0.value < $1.value || $0.value == $1.value && $0.key > $1.key
            }
            .reduce(into: [Int]()) { partialResult, numCount in
                for _ in 1 ... numCount.value {
                    partialResult.append(numCount.key)
                }
            }
    }
}
