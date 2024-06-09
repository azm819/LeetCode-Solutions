class Solution {
    func pivotArray(_ nums: [Int], _ pivot: Int) -> [Int] {
        var less = [Int]()
        var equalCount = 0
        var greater = [Int]()
        for num in nums {
            if num < pivot {
                less.append(num)
            } else if num == pivot {
                equalCount += 1
            } else {
                greater.append(num)
            }
        }

        return less + Array(repeating: pivot, count: equalCount) + greater
    }
}

