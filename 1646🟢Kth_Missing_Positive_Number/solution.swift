class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var l = 0
        var r = arr.count - 1
        var curK = k - arr[0] + 1
        guard curK > .zero else { return k }
        let diff = (arr[r] - arr[l]) - (r - l)
        guard diff >= curK else {
            return arr[r] + (curK - diff)
        }
        while l < r {
            let c = (l + r + 1) / 2
            let diff = (arr[c] - arr[l]) - (c - l)
            if diff < curK {
                curK -= diff
                l = c
            } else {
                if l + 1 == r {
                    return arr[l] + curK
                }
                r = c
            }
        }
        return arr[r]
    }
}
