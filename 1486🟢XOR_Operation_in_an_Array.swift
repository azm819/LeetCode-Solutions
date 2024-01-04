class Solution {
    func xorOperation(_ n: Int, _ start: Int) -> Int {
        guard n > 1 else { return start }
        var result = start
        var current = start
        for _ in 1 ..< n {
            current += 2
            result ^= current
        }
        return result
    }
}

