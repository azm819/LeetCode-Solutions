class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var sub = [nums.first!]
        for num in nums {
            if num > sub.last! {
                sub.append(num)
            } else {
                var l = 0
                var r = sub.count - 1
                while l < r {
                    let c = (l + r) / 2
                    if sub[c] < num {
                        l = c + 1
                    } else {
                        r = c
                    }
                }
                sub[l] = num
            }
        }
        return sub.count
    }
}
