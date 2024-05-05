class Solution {
    private func moveToLeft(_ num: Int, from ind: inout Int,_ nums: inout [Int]) {
        var numInd = ind + 1
        while numInd < nums.count && nums[numInd] != num {
            numInd += 1
        }
        while numInd < nums.count {
            nums.swapAt(ind, numInd)
            ind += 1
            numInd += 1
            while numInd < nums.count && nums[numInd] != num {
                numInd += 1
            }
        }
    }

    func sortColors(_ nums: inout [Int]) {
        var curInd = 0
        while curInd < nums.count && nums[curInd] == 0 {
            curInd += 1
        }
        moveToLeft(0, from: &curInd, &nums)
        while curInd < nums.count && nums[curInd] == 1 {
            curInd += 1
        }
        moveToLeft(1, from: &curInd, &nums)
    }
}
