class Solution {
    func divideArray(_ nums: [Int], _ k: Int) -> [[Int]] {
        guard nums.count % 3 == .zero else { return [] }
        let nums = nums.sorted()
        var result = [[Int]]()
        var curArr = [Int]()
        var last: Int?

        for num in nums {
            if last == nil {
                last = num
                curArr = [num]
            } else {
                if num - last! > k {
                    return []
                }
                curArr.append(num)
                if curArr.count == 3 {
                    if num - curArr.first! > k {
                        return []
                    }
                    result.append(curArr)
                    last = nil
                } else {
                    last = num
                }
            }
        }

        return result
    }
}

