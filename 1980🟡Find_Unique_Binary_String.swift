class Solution {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        var result = ""
        var ind = nums[0].startIndex
        for num in nums {
            result.append(num[ind] == "0" ? "1" : "0")
            ind = num.index(after: ind)
        }
        return result
    }
}
