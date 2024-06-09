class Solution {
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var mods = Array(repeating: 0, count: k)
        mods[0] = 1
        var curMod = 0
        var result = 0
        for num in nums {
            curMod = ((curMod + num) % k + k) % k
            result += mods[curMod]
            mods[curMod] += 1
        }
        return result
    }
}
