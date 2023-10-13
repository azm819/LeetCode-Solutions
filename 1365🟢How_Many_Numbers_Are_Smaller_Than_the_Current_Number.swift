class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        let sortedNums = nums.sorted()
        var numsDict = [Int: Int]()
        numsDict[sortedNums[0]] = 0
        for i in 1 ..< sortedNums.count {
            numsDict[sortedNums[i]] = sortedNums[i] == sortedNums[i - 1] ? numsDict[sortedNums[i - 1]]! : i
        }
        return nums.map { numsDict[$0]! }
    }
}
