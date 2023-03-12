class Solution {
    struct Permutation: OptionSet {
        let rawValue: Int

        static let all = [
            Permutation(rawValue: 1 << 0),
            Permutation(rawValue: 1 << 1),
            Permutation(rawValue: 1 << 2),
            Permutation(rawValue: 1 << 3),
            Permutation(rawValue: 1 << 4),
            Permutation(rawValue: 1 << 5),
        ]
    }

    func permute(
        _ nums: [Int],
        _ permutation: Permutation = Permutation(rawValue: .zero),
        _ lastRes: [Int] = []
    ) -> [[Int]] {
        var result = [[[Int]]]()
        for i in 0..<nums.count where !permutation.contains(.all[i]) {
            result.append(permute(nums, permutation.union(.all[i]), lastRes + [nums[i]]))
        }
        if result.isEmpty {
            return [lastRes]
        } else {
            return result.flatMap { $0 }
        }
    }
}
