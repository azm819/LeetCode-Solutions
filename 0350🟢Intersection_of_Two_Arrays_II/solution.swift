class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var counts = [Int: Int]()
        for num in nums1 {
            counts[num, default: .zero] += 1
        }

        return nums2.filter { num in
            guard let count = counts[num] else { return false }
            counts[num] = count > 1 ? count - 1 : nil
            return true
        }
    }
}

