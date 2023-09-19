class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        guard n > 1 else { return n == 1 }
        return n % 3 == 0 && isPowerOfThree(n / 3)
    }
}
