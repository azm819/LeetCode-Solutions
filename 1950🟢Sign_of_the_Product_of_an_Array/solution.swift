class Solution {
    func arraySign(_ nums: [Int]) -> Int {
        var flag = true
        for num in nums {
            if num == .zero {
                return .zero
            } else if num < .zero {
                flag.toggle()
            }
        }
        return flag ? 1 : -1
    }
}
