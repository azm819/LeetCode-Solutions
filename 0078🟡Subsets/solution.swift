class Solution {
    private func backtrack(_ ind: Int, _ nums: [Int], _ subRes: inout [Int], _ result: inout [[Int]]) {
        guard ind < nums.count else {
            result.append(subRes)
            return
        }

        subRes.append(nums[ind])
        backtrack(ind + 1, nums, &subRes, &result)
        subRes.removeLast()
        backtrack(ind + 1, nums, &subRes, &result)
    }

    func subsets(_ nums: [Int]) -> [[Int]] {
        var subRes = [Int]()
        var result = [[Int]]()
        backtrack(.zero, nums, &subRes, &result)
        return result
    }
}
