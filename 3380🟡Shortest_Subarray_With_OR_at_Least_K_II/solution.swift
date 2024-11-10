class Solution {
    private func bitsToNum(_ bits: [Int]) -> Int {
        var result = 0
        var bit = 1
        for i in 0 ..< bits.count {
            if bits[i] > .zero {
                result += bit
            }
            bit *= 2
        }
        return result
    }

    private func or(bits: inout [Int], num: Int) {
        var num = num
        for i in 0 ..< bits.count {
            bits[i] += num % 2
            num /= 2
        }
    }

    private func minusOr(bits: inout [Int], num: Int) {
        var num = num
        for i in 0 ..< bits.count {
            bits[i] -= num % 2
            num /= 2
        }
    }

    func minimumSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
        guard k > .zero else { return 1 }

        var result: Int = .max
        var l = 0
        var r = 0
        var bitwiseOr = Array(repeating: Int.zero, count: 30)
        while r < nums.count {
            while r < nums.count && bitsToNum(bitwiseOr) < k {
                or(bits: &bitwiseOr, num: nums[r])
                r += 1
            }

            while l < r && bitsToNum(bitwiseOr) >= k {
                result = min(result, r - l)
                minusOr(bits: &bitwiseOr, num: nums[l])
                l += 1
            }
        }
        return result == .max ? -1 : result
    }
}
