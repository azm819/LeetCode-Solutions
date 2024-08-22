class Solution {
    func bitwiseComplement(_ n: Int) -> Int {
        guard n > .zero else { return 1 }
        var mask = 1
        while mask <= n {
            mask *= 2
        }
        mask -= 1
        return mask ^ n
    }
}

