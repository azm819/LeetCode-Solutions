class Solution {
    private func findSubsequences(_ nums: [Int], _ ind: Int, _ result: inout Set<[Int]>) {
        guard ind < nums.count else { return }
        let val = nums[ind]
        var resultA = Set<[Int]>()
        for res in result {
            if res.last! <= val {
                resultA.insert(res + [val])
            }
        }
        result.formUnion(resultA)
        var i = ind - 1
        while i >= 0 {
            if nums[i] <= val {
                result.insert([nums[i], val])
            }
            i -= 1
        }
        findSubsequences(nums, ind + 1, &result)
    }

    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 1 else { return [] }
        var result = Set<[Int]>()
        findSubsequences(nums, 1, &result)
        return Array(result)
    }
}
