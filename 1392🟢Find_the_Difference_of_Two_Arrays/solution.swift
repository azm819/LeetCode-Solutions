class Solution {
    private struct Source: OptionSet {
        let rawValue: Int

        static let none = Source(rawValue: 0)
        static let first = Source(rawValue: 1 << 0)
        static let second = Source(rawValue: 1 << 1)
    }

    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        var appearances = [Int: Source]()
        for int in nums1 {
            appearances[int] = .first
        }
        for int in nums2 {
            appearances[int, default: .none].insert(.second)
        }
        var result: [[Int]] = [[], []]
        for (key, value) in appearances {
            switch value {
            case .first:
                result[0].append(key)
            case .second:
                result[1].append(key)
            default:
                break
            }
        }
        return result
    }
}

