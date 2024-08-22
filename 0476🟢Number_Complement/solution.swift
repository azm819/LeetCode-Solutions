class Solution {
    func findComplement(_ num: Int) -> Int {
        var mask = 1
        while mask <= num {
            mask *= 2
        }
        mask -= 1
        return mask ^ num
    }
}

