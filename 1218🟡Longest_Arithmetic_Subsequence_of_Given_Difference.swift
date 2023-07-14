class Solution {
    func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
        var states = [Int: Int]()
        for num in arr {
            let prev = num - difference
            states[num] = max(states[num, default: .zero], states[prev, default: .zero] + 1)
        }
        return states.values.max() ?? .zero
    }
}
