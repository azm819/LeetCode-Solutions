class Solution {
    func getSneakyNumbers(_ nums: [Int]) -> [Int] {
        var numsSet = Set<Int>()
        var result = [Int]()
        for num in nums where !numsSet.insert(num).inserted {
            result.append(num)
        }
        return result
    }
}

