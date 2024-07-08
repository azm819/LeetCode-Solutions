class Solution {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        guard n > 1 else { return 1 }
        var result: Int = .zero
        for i in 2 ... n {
            result = (result + k) % i
        }
        return result + 1
    }
}
