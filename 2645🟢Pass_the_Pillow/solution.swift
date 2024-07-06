class Solution {
    func passThePillow(_ n: Int, _ time: Int) -> Int {
        (time / (n - 1)) % 2 == .zero ? 1 + time % (n - 1) : n - time % (n - 1)
    }
}

