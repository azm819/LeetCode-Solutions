class Solution {
    func canArrange(_ arr: [Int], _ k: Int) -> Bool {
        var modCounts = [Int: Int]()
        for num in arr {
            modCounts[(k + num % k) % k, default: .zero] += 1
        }

        guard modCounts[.zero, default: .zero] % 2 == .zero else {
            return false
        }

        if k > 2 {
            for mod in 1 ... (k - 1) / 2 {
                if modCounts[mod] != modCounts[k - mod] {
                    return false
                }
            }
        }

        if k % 2 == .zero && modCounts[k / 2, default: .zero] % 2 != .zero {
            return false
        }

        return true
    }
}
