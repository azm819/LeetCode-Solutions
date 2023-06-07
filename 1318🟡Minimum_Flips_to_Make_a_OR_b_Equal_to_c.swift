class Solution {
    func minFlips(_ a: Int, _ b: Int, _ c: Int) -> Int {
        var a = a
        var b = b
        var c = c
        var result = 0
        while a != .zero || b != .zero || c != .zero {
            let aBit = a & 1
            let bBit = b & 1
            let cBit = c & 1
            a >>= 1
            b >>= 1
            c >>= 1
            if aBit | bBit != cBit {
                if cBit == .zero {
                    result += aBit + bBit
                } else {
                    result += 1
                }
            }
        }
        return result
    }
}

