class Solution {
    func minDifference(_ nums: [Int]) -> Int {
        guard nums.count > 4 else { return .zero }

        var minValues = [Int]()
        var maxValues = [Int]()
        for num in nums {
            minValues.append(num)
            minValues.sort(by: <)
            if minValues.count > 4 {
                minValues.removeLast()
            }

            maxValues.append(num)
            maxValues.sort(by: >)
            if maxValues.count > 4 {
                maxValues.removeLast()
            }
        }

        var result: Int = .max
        for i in 0 ..< 4 {
            result = min(result, maxValues[i] - minValues[3 - i])
        }
        return result
    }
}

