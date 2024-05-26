class Solution {
    func numberGame(_ nums: [Int]) -> [Int] {
        let sortedNums = nums.sorted()
        var result = [Int]()
        for i in 0 ..< sortedNums.count / 2 {
            result.append(sortedNums[i * 2 + 1])
            result.append(sortedNums[i * 2])
        }
        return result
    }
}

