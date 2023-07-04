class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var bitSums = Array(repeating: 0, count: 32)
        var negCount = 0
        for var num in nums {
            if num < .zero {
                negCount += 1
                num = abs(num)
            }
            var ind = 0
            while num > .zero {
                if num & 1 == 1 {
                    bitSums[ind] += 1
                }
                num >>= 1
                ind += 1
            }
        }
        bitSums = bitSums.map { $0 % 3 }
        var result = 0
        for i in 0..<32 {
            if bitSums[i] == 1 {
                result += 1 << i
            }
        }
        return negCount % 3 == 1 ? -result : result
    }
}
