class Solution {
    func findMatrix(_ nums: [Int]) -> [[Int]] {
        var counts = [Int: Int]()
        var result = [[Int]]()
        for num in nums {
            let curCount = counts[num, default: .zero]
            if result.count == curCount {
                result.append([])
            }
            result[curCount].append(num)
            counts[num] = curCount + 1
        }
        return result
    }
}

