class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var presented = Set<Int>()
        var result = [Int]()
        for num in nums where !presented.insert(num).inserted {
            result.append(num)
        }
        var num = 1
        while true {
            if !presented.contains(num) {
                result.append(num)
                break
            }
            num += 1
        }
        return result
    }
}

