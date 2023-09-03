class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        var counts = Array(repeating: 0, count: 1001)
        for citation in citations where citation > .zero {
            for i in 1 ... citation {
                counts[i] += 1
            }
        }
        var result = 0
        for i in 1 ... 1000 where counts[i] >= i {
            result = i
        }
        return result
    }
}

