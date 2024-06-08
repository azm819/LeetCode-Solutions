class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var remainderToInd = [Int: Int]()
        remainderToInd[0] = -1
        var curRem: Int = .zero
        for i in 0 ..< nums.count {
            curRem = (curRem + nums[i]) % k
            if let ind = remainderToInd[curRem] {
                if i - ind >= 2 {
                    return true
                }
            } else {
                remainderToInd[curRem] = i
            }
        }
        return false
    }
}

