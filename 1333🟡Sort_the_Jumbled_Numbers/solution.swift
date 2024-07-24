class Solution {
    private func getMappedNumber(_ num: Int, _ cache: inout [Int: Int]) -> Int {
        if let cachedNum = cache[num] {
            return cachedNum
        }

        let mappedNum = getMappedNumber(num / 10, &cache) * 10 + getMappedNumber(num % 10, &cache)
        cache[num] = mappedNum
        return mappedNum
    }

    func sortJumbled(_ mapping: [Int], _ nums: [Int]) -> [Int] {
        var cache = [Int: Int]()
        for i in 0 ..< mapping.count {
            cache[i] = mapping[i]
        }
        return nums.sorted { getMappedNumber($0, &cache) < getMappedNumber($1, &cache) }
    }
}
