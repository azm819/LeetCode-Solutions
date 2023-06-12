class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard nums.count > 1 else { return nums.map(String.init) }
        var startInd = 0
        var ind = 1
        var result = [String]()
        while ind < nums.count {
            if nums[ind] != nums[ind - 1] + 1 {
                if ind - 1 == startInd {
                    result.append("\(nums[startInd])")
                } else {
                    result.append("\(nums[startInd])->\(nums[ind - 1])")
                }
                startInd = ind
            }
            ind += 1
        }
        if nums.count - 1 == startInd {
            result.append("\(nums[startInd])")
        } else {
            result.append("\(nums[startInd])->\(nums[ind - 1])")
        }
        return result
    }
}
