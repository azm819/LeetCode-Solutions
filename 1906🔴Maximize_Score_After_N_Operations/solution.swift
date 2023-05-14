class Solution {
    private func gcd(_ a: Int, _ b: Int) -> Int {
        guard b != .zero else { return a }
        return gcd(b, a % b)
    }

    private var cache = [Int: Int]()

    private func dp(
        _ gcds: [Int: Int],
        _ curMask: Int,
        _ curStep: Int,
        _ maxSteps: Int,
        _ curRes: Int
    ) -> Int {
        guard curStep <= maxSteps else { return curRes }
        if let cached = cache[curMask], cached >= curRes {
            return .zero
        }
        cache[curMask] = curRes
        var res = 0
        for (mask, gcd) in gcds {
            if curMask | mask == curMask + mask {
                res = max(res, dp(gcds, curMask | mask, curStep + 1, maxSteps, curRes + curStep * gcd))
            }
        }
        return res
    }

    private let masks: [Int] = {
        var masks = [Int]()
        var curMask = 1
        for _ in 1...14 {
            masks.append(curMask)
            curMask = curMask << 1
        }
        return masks
    }()

    func maxScore(_ nums: [Int]) -> Int {
        var gcds = [Int: Int]()
        for i in 0..<nums.count - 1 {
            for j in i + 1..<nums.count {
                gcds[masks[i] | masks[j]] = gcd(nums[i], nums[j])
            }
        }
        defer {
            cache.removeAll()
        }
        return dp(gcds, .zero, 1, nums.count / 2, .zero)
    }
}

