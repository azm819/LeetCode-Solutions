class Solution {
    func countTriplets(_ arr: [Int]) -> Int {
        guard arr.count > 1 else {
            return .zero
        }

        var prefixXors = [0]
        var xor = 0
        for num in arr {
            xor ^= num
            prefixXors.append(xor)
        }

        var result = 0
        for i in 0 ..< prefixXors.count - 1 {
            for j in i + 1 ..< prefixXors.count where prefixXors[i] == prefixXors[j] {
                result += j - i - 1
            }
        }
        return result
    }
}

