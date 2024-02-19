class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        n > 0 && (1 << 31) % n == 0
    }
}

