class Solution {
    private var cache = [0: 0]

    private func getBits(_ num: Int) -> Int {
        if let cachedRes = cache[num] {
            return cachedRes
        }
        var result = num % 2
        result += getBits(num / 2)
        cache[num] = result
        return result
    }

    func sortByBits(_ arr: [Int]) -> [Int] {
        arr.sorted { lhs, rhs in
            let lhsBits = getBits(lhs)
            let rhsBits = getBits(rhs)
            return lhsBits < rhsBits || lhsBits == rhsBits && lhs < rhs
        }
    }
}
