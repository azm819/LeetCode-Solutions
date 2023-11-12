class Solution {
    func decode(_ encoded: [Int], _ first: Int) -> [Int] {
        var result = [first]
        var prev = first
        for num in encoded {
            prev ^= num
            result.append(prev)
        }
        return result
    }
}

