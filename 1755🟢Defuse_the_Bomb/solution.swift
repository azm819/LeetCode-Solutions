class Solution {
    func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        var result = Array(repeating: Int.zero, count: code.count)

        if k > .zero {
            var l = 0
            var r = 0
            var curSum = 0
            while r < k {
                curSum += code[r]
                r += 1
            }

            result[code.count - 1] = curSum
            while l < code.count {
                curSum -= code[l]
                l += 1
                curSum += code[r]
                r = (r + 1) % code.count
                result[l - 1] = curSum
            }
        } else if k < .zero {
            var l = 0
            var r = 0
            var curSum = 0
            let absK = abs(k)
            while r < absK {
                curSum += code[r]
                r += 1
            }

            result[r] = curSum
            while l < code.count {
                curSum -= code[l]
                l += 1
                curSum += code[r]
                r = (r + 1) % code.count
                result[r] = curSum
            }
        }

        return result
    }
}
