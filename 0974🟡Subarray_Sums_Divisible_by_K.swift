class Solution {
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var mods = Array(repeating: 0, count: k)
        mods[0] = 1
        var prevSum = 0
        var result = 0
        for num in nums {
            prevSum = ((prevSum + num) % k + k) % k
            result += mods[prevSum]
            mods[prevSum] += 1
        }
        return result
    }
}
