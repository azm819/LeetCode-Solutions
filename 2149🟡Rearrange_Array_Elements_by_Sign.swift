class Solution {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var posInd = -1
        var negInd = -1
        var isPosState = true
        while result.count < nums.count {
            if isPosState {
                posInd += 1
                while posInd < nums.count && nums[posInd] < 0 {
                    posInd += 1
                }
                result.append(nums[posInd])
            } else {
                negInd += 1
                while negInd < nums.count && nums[negInd] > 0 {
                    negInd += 1
                }
                result.append(nums[negInd])
            }
            isPosState.toggle()
        }
        return result
    }
}
