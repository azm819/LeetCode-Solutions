class Solution {
    private func dp(_ n: Int, _ k: Int) -> Int {
        guard n > .zero else { return 0 }

        let prev = dp(n - 1, k / 2)
        return k % 2 == 0 ? prev : 1 - prev
    }

    func kthGrammar(_ n: Int, _ k: Int) -> Int {
        dp(n - 1, k - 1)
    }
}
