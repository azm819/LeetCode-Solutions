class Solution {
    private struct Source: OptionSet {
        let rawValue: Int

        static let none = Source(rawValue: 0)
        static let first = Source(rawValue: 1)
        static let second = Source(rawValue: 2)
    }

    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        var appearances = [Int: Source]()
        for int in nums1 {
            appearances[int, default: .none].insert(.first)
        }
        for int in nums2 {
            appearances[int, default: .none].insert(.second)
        }
        var result: [[Int]] = [[], []]
        for (k, v) in appearances {
            if v.rawValue == 1 {
                result[0].append(k)
            } else if v.rawValue == 2 {
                result[1].append(k)
            }
        }
        return result
    }
}
